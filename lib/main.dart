import 'dart:async';

import 'package:emoroid_digest_app/pages/feedback.dart';
import 'package:emoroid_digest_app/pages/global_navigation_state.dart';
import 'package:emoroid_digest_app/pages/drawer.dart';
import 'package:emoroid_digest_app/pages/home.dart';
import 'package:emoroid_digest_app/pages/notification_page.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_bar.dart';
import 'package:emoroid_digest_app/pages/search_page.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:emoroid_digest_app/services/services_locator.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:emoroid_digest_app/pages/podcast/podcasts_list_page.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summaries_list_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:uni_links/uni_links.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'utils/local_file.dart';
import 'package:emoroid_digest_app/models/message.dart' as m;

final firestore = FirebaseFirestore.instance;
final functions = FirebaseFunctions.instance;

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// Notifications
Future<void> backgroundHandler(RemoteMessage message) async {
  // Allow background Handler to use EmoroidAppState methods
  final GlobalKey<_TheEmoroidDigestAppState> key = GlobalKey<_TheEmoroidDigestAppState>();
  final _TheEmoroidDigestAppState emoroidAppState = key.currentState!;

  // Initialize FlutterLocalNotificationsPlugin instance
  late FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();

  // Configure Android display details
  AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    '0',
    '0',
    styleInformation: BigTextStyleInformation(
      message.notification!.body.toString(),
      htmlFormatBigText: true,
      contentTitle: message.notification!.title.toString(),
      htmlFormatContentTitle: true,
    ),
    importance: Importance.max,
    priority: Priority.max,
    playSound: true,
  );

  // Configure iOS display details
  DarwinNotificationDetails iosDetails =
      const DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);

  // Display notification on device
  await localNotifications.show(
      message.data.hashCode,
      message.notification?.title,
      message.notification?.body,
      NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      ),
      payload: message.data['body']);

  String msgId = '';
  if (message.data.containsKey('visualSummaryId')) {
    msgId = 'visualSummaryId';
  } else if (message.data.containsKey('podcastId')) {
    msgId = 'podcastId';
  }
  m.Message newMessage = m.Message()
    ..id = message.data[msgId] ?? ''
    ..title = message.notification?.title ?? ''
    ..body = message.notification?.body ?? '';

  emoroidAppState.setState(() {
    IsarService.instance.saveMessage(newMessage);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "Emroid-Digest-App",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.signInAnonymously();

  FirebaseMessaging.instance;
  // Notifications
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  await IsarService.instance.init();
  LocalFileSystem.init();

  await setupServiceLocator();

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
      home: ChangeNotifierProvider(
        create: (BuildContext context) => GlobalNavigationState(context: context),
        child: TheEmoroidDigestApp(title: title),
      ),
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
  // Notifications
  int notificationCount = IsarService.instance.getMessages().length;
  final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();
  late StreamSubscription<int> notificationStream;

  int _pageIndex = 1;
  final navigatorKeyBody = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Notifications set up
    handleNotification();

    // Deep Links set up
    Uri? _currentURI;
    StreamSubscription? _streamSubscription;

    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        _currentURI = uri;
        debugPrint('Received URI: $uri');

        if (uri != null && uri.path == '/visualSummary/detail') {
          debugPrint('Received deep link: ${uri.toString()}');
          final id = uri.queryParameters['id'];
          Provider.of<GlobalNavigationState>(context, listen: false).page = 0;
          navigatorKeyBody.currentState!.pushNamed(
            "/visual-summary/detail",
            arguments: VisualSummaryDetailPageArguments(id.toString()),
          );
        } else if (uri != null && uri.path == '/podcast/detail') {
          debugPrint('Received deep link: ${uri.toString()}');
          final id = uri.queryParameters['id'];
          Provider.of<GlobalNavigationState>(context, listen: false).page = 2;
          navigatorKeyBody.currentState!.pushNamed(
            "/podcast/detail",
            arguments: PodcastDetailPageArguments(id.toString()),
          );
        }
      }, onError: (Object err) {
        debugPrint('Error occurred: $err');
      });
    }
  }

  // Notifications
  void handleNotification() async {
    // Get instance of FirebaseMessaging class which handles receiving push notifications
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Ask user permission to receive push notifications
    NotificationSettings settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      print(token);

      // Subscribe device to "New Visual Summary" and "New Podcast" topics
      await messaging.subscribeToTopic("NewVisualSummary");
      await messaging.subscribeToTopic("NewPodcast");

      const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();
      const InitializationSettings initializationSettings =
          InitializationSettings(android: androidSettings, iOS: iosSettings);
      await localNotifications.initialize(initializationSettings);

      // Work in Progress - Notifications
      FirebaseMessaging.instance.getInitialMessage();
      notificationStream = IsarService.instance.getMessageCountStream().listen((count) {
        setState(() {
          notificationCount = count;
        });
      });

      // Handle incoming messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        // Configure Android display details
        AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
          '0',
          '0',
          styleInformation: BigTextStyleInformation(
            message.notification!.body.toString(),
            htmlFormatBigText: true,
            contentTitle: message.notification!.title.toString(),
            htmlFormatContentTitle: true,
          ),
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
        );

        // Configure iOS display details
        DarwinNotificationDetails iosDetails =
            const DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);

        // Display notification on device
        await localNotifications.show(
            message.data.hashCode,
            message.notification?.title,
            message.notification?.body,
            NotificationDetails(
              android: androidDetails,
              iOS: iosDetails,
            ),
            payload: message.data['body']);

        String msgId = '';
        if (message.data.containsKey('visualSummaryId')) {
          msgId = 'visualSummaryId';
        } else if (message.data.containsKey('podcastId')) {
          msgId = 'podcastId';
        }
        m.Message newMessage = m.Message()
          ..id = message.data[msgId] ?? ''
          ..title = message.notification?.title ?? ''
          ..body = message.notification?.body ?? '';
        setState(() {
          IsarService.instance.saveMessage(newMessage);
        });
      });
    }
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
    Navigator.popUntil(navigatorKeyBody.currentContext!, (route) {
      currentRoute = route.settings.name!;
      if (currentRoute.startsWith("/notification")) {
        return false;
      }
      return true;
    });
    if (currentRoute == "/search") return;
    navigatorKeyBody.currentState!.pushNamed("/search");
  }

  Future<void> _onNotificationTapped() async {
    String currentRoute = "";
    Navigator.popUntil(navigatorKeyBody.currentContext!, (route) {
      currentRoute = route.settings.name!;
      if (currentRoute.startsWith("/search")) {
        return false;
      }
      return true;
    });
    if (currentRoute == "/notification") return;
    navigatorKeyBody.currentState!.pushNamed("/notification");
  }

  Future<void> _onNavButtonTapped(int newIndex, GlobalNavigationState bottomNavBarState) async {
    if (newIndex == bottomNavBarState.page) return;
    bottomNavBarState.page = newIndex;
    switch (newIndex) {
      case 0:
        navigatorKeyBody.currentState!.pushReplacementNamed("/visual-summary");
        break;
      case 1:
        navigatorKeyBody.currentState!.pushReplacementNamed("/home");
        break;
      case 2:
        navigatorKeyBody.currentState!.pushReplacementNamed("/podcast");
        break;
    }
  }

  Widget _buildBody(GlobalNavigationState bottomNavBarState) {
    return WillPopScope(
      onWillPop: () async {
        await navigatorKeyBody.currentState!.maybePop();
        bottomNavBarState.updateBasedOnRoute();
        return false;
      },
      child: Column(
        children: [
          Expanded(
            child: Navigator(
              key: navigatorKeyBody,
              initialRoute: "/home",
              onGenerateRoute: (settings) {
                Widget page;
                switch (settings.name) {
                  case "/home":
                    page = const HomePage();
                    break;
                  case "/":
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
                  case "/feedback":
                    page = const FeedBackPage();
                    break;
                  default:
                    page = const HomePage();
                    print('Unknown page: ${settings.name!}');
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
          PodcastBar(navigatorKey: navigatorKeyBody)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarState = Provider.of<GlobalNavigationState>(context);
    bottomNavBarState.navigatorKey = navigatorKeyBody;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // Work in Progress - Notifications
          Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                tooltip: 'Notifications',
                onPressed: _onNotificationTapped,
              ),
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
      body: _buildBody(bottomNavBarState),
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
        currentIndex: bottomNavBarState.page,
        selectedItemColor: Colors.blue[800],
        onTap: (int val) {
          _onNavButtonTapped(val, bottomNavBarState);
        },
      ),
      drawer: HomePageDrawer(
        navigatorKeyBody: navigatorKeyBody,
      ),
    );
  }
}
