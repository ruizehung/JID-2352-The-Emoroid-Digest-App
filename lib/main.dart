import 'package:emoroid_digest_app/home/home.dart';
import 'package:emoroid_digest_app/isar_service.dart';
import 'package:emoroid_digest_app/visual_summary/visual_summaries_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final firestore = FirebaseFirestore.instance;
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// Notifications
Future<void> backgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails('dbfood', 'dbfood',
          importance: Importance.max,
          styleInformation: bigTextStyleInformation,
          priority: Priority.max,
          playSound: true);

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics, iOS: const DarwinNotificationDetails());

      await flutterLocalNotificationsPlugin.show(
          0, message.notification?.title, message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp(
    name: 'Emroid-Digest-App',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Notifications
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  IsarService.init();
  FirebaseAuth.instance.signInAnonymously();

  runApp(const TheEmoroidDigestAppWrapper());
}

class TheEmoroidDigestAppWrapper extends StatelessWidget {
  const TheEmoroidDigestAppWrapper({super.key});
  final String title = 'The Emoroid Digest';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue[800],
          secondary: Colors.blue.shade800,
        ),
      ),
      home: TheEmoroidDigestApp(title: title),
    );
  }
}

class TheEmoroidDigestApp extends StatefulWidget {
  const TheEmoroidDigestApp({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<TheEmoroidDigestApp> createState() => _TheEmoroidDigestAppState();
}

class _TheEmoroidDigestAppState extends State<TheEmoroidDigestApp> with WidgetsBindingObserver {
  int _pageIndex = 1;
  int notificationCount = 0;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final List<Widget> _widgetOptions = <Widget>[
    const VisualSummaryPage(),
    const HomePage(),
    const Text('Index 2: Podcasts'),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Notifications
    initNotification();
  }

  // Notifications
  void initNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    await messaging.subscribeToTopic("NewVisualSummary");
    await messaging.subscribeToTopic("NewPodcast");

    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse payload) async {
      try {
        if (payload != null) {
        } else {}
      } catch (e) {}
      return;
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('onMessage: ${message.notification?.title}/${message.notification?.body}');

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails('dbfood', 'dbfood',
          importance: Importance.max,
          styleInformation: bigTextStyleInformation,
          priority: Priority.max,
          playSound: true);

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics, iOS: const DarwinNotificationDetails());

      await flutterLocalNotificationsPlugin.show(
          0, message.notification?.title, message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);

      setState(() {
        notificationCount++;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive || state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;
    if (isBackground) {
      // app is now moved to background
    } else {
      analytics.logAppOpen();
    }
  }

  Future<void> _onNavButtonTapped(int index) async {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // Notifications
          Stack(children: <Widget>[
            IconButton(
                icon: const Icon(Icons.notifications),
                tooltip: 'Notifications',
                onPressed: () {
                  setState(() {
                    notificationCount = 0;
                  });
                  // Add functionality ---> Display Notifications
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Notifications clicked!')));
                }),
            notificationCount != 0
                ? Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '$notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Container()
          ]),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Search clicked!')));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _widgetOptions.elementAt(_pageIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: "Visual Summaries",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: "Podcasts",
          ),
        ],
        currentIndex: _pageIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onNavButtonTapped,
      ),
      drawer: Drawer(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text("Sign out"),
            ),
          )
        ]),
      ),
    );
  }
}
