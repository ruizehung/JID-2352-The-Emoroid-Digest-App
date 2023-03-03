import 'package:emoroid_digest_app/pages/home.dart';
import 'package:emoroid_digest_app/pages/notification_page.dart';
import 'package:emoroid_digest_app/pages/search_page.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:emoroid_digest_app/pages/podcast/podcasts_list_page.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summaries_list_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'utils/local_file.dart';

final firestore = FirebaseFirestore.instance;
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// Work in Progress - Notifications
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
      importance: Importance.max, styleInformation: bigTextStyleInformation, priority: Priority.max, playSound: true);

  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics, iOS: const DarwinNotificationDetails());

  await flutterLocalNotificationsPlugin.show(
      0, message.notification?.title, message.notification?.body, platformChannelSpecifics,
      payload: message.data['body']);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Emroid-Digest-App',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Work in Progress - Notifications
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  IsarService.init();
  LocalFileSystem.init();
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
  final navigatorKey = GlobalKey<NavigatorState>();
  final visualSummaryNavigatorKey = GlobalKey<NavigatorState>();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Work in Progress - Notifications
    initNotification();
  }

  // Work in Progress - Notifications
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

  Future<void> _onSearchTapped() async {
    String currentRoute = "";
    Navigator.popUntil(navigatorKey.currentContext!, (route) {
      currentRoute = route.settings.name!;
      if (currentRoute.startsWith("/notification")) {
        return false;
      }
      return true;
    });
    if (currentRoute == "/search") return;
    setState(() {
      notificationCount = 0;
    });
    navigatorKey.currentState!.pushNamed("/search");
  }

  Future<void> _onNotificationTapped() async {
    String currentRoute = "";
    Navigator.popUntil(navigatorKey.currentContext!, (route) {
      currentRoute = route.settings.name!;
      if (currentRoute.startsWith("/search")) {
        return false;
      }
      return true;
    });
    if (currentRoute == "/notification") return;
    setState(() {
      notificationCount = 0;
    });
    navigatorKey.currentState!.pushNamed("/notification");
  }

  Future<void> _onNavButtonTapped(int index) async {
    if (index == _pageIndex) return;
    setState(() => _pageIndex = index);
    switch (index) {
      case 0:
        navigatorKey.currentState!.pushReplacementNamed("/visual-summary");
        break;
      case 1:
        navigatorKey.currentState!.pushReplacementNamed("/home");
        break;
      case 2:
        navigatorKey.currentState!.pushReplacementNamed("/podcast");
        break;
    }
  }

  Widget _buildBody() {
    return WillPopScope(
      onWillPop: () async {
        navigatorKey.currentState!.maybePop();
        return false;
      },
      child: Column(
        children: [
          Expanded(
            child: Navigator(
              key: navigatorKey,
              initialRoute: "/home",
              onGenerateRoute: (settings) {
                Widget page;
                switch (settings.name) {
                  case "/home":
                    page = const HomePage();
                    break;
                  case "/visual-summary":
                    page = const VisualSummaryListPage();
                    break;
                  case "/visual-summary/detail":
                    page = const VisualSummaryDetailPage();
                    break;
                  case "/podcast":
                    page = const PodcastListPage();
                    break;
                  case "/podcast/detail":
                    page = const PodcastDetailPage();
                    break;
                  case "/notification":
                    page = const NotificationPage();
                    break;
                  case "/search":
                    page = const SearchPage();
                    break;
                  default:
                    page = Text('Unknown page: ${settings.name!}');
                }

                return PageRouteBuilder(
                  pageBuilder: (context, __, ___) => page,
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                  settings: settings,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // Work in Progress - Notifications
          Stack(children: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: _onNotificationTapped,
            ),
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
            onPressed: _onSearchTapped,
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
