import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:mime/mime.dart';

final firestore = FirebaseFirestore.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Emroid-Digest-App',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue[800],
          secondary: Colors.blue.shade800,
        ),
      ),
      home: const MyHomePage(title: 'The Emoroid Digest App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("clicked $title summary");
        },
        child: Card(
            child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FutureBuilder<List?>(
                    future: downloadFileFromStorage(image),
                    builder: (BuildContext context, AsyncSnapshot future) {
                      if (!future.hasData) {
                        return Container(child: Text("No image"));
                      } else {
                        if (future.data != null &&
                            future.data[1] == 'application/pdf') {
                          return SizedBox(
                              height: 240.0,
                              child: SfPdfViewer.memory(future.data[0],
                                  enableDoubleTapZooming: false));
                        } else if (future.data != null &&
                            (future.data[1] == 'image/jpeg' ||
                                future.data[1] == 'image/png')) {
                          return Image.memory(future.data[0]);
                        } else {
                          return Text("no image data");
                        }
                      }
                    })
                // Image(image: image)
              ],
            ))
          ],
        )));
  }
}

// class UseCard extends StatelessWidget {
//   const UseCard({super.key, required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     /// Usage
//     return CustomCard(
//       title: title,
//       // onPress: () {
//       //   print('Card $index');
//       // },
//     );
//   }
// }

// final List summaryList = readVisualSummariesFromFirestore();
Future<List<Object>> readVisualSummariesFromFirestore() async {
  CollectionReference visualSummariesRef =
      FirebaseFirestore.instance.collection('Visual Summaries');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await visualSummariesRef.get();
  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  List<Object> cards = [];

  for (var visualSummary in allData) {
    if (visualSummary != null) {
      cards.add(visualSummary);
    }
    // print(visualSummary);
  }
  return cards;
}

// Pass in "link_summary_storage" or "link_thumbnail_storage" field
Future<List?> downloadFileFromStorage(String path) async {
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();

  final fileRef = storageRef.child(path);

  try {
    final Uint8List? data = await fileRef.getData();
    final mime = lookupMimeType('', headerBytes: data);
    // Uint8List? _imageBytesDecoded = base64.decode(data);
    return [data, mime];
    // Data for "images/island.jpg" is returned, use this as needed.
  } on FirebaseException catch (e) {
    // Handle any errors.
  }
  return null;
}

class VisualSummariesList extends StatelessWidget {
  // const VisualSummariesList();

  // Future<List<Widget>> summaryList = readVisualSummariesFromFirestore();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<Object>>(
            future: readVisualSummariesFromFirestore(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Object>> future) {
              if (!future.hasData) {
                return Container(
                  child: new Text('loading'),
                );
              } else {
                return ListView(
                    cacheExtent: 9999,
                    // UseCard card = UseCard(title: "w");
                    children: List<Widget>.generate(
                        future.data!.length,
                        (index) => CustomCard(
                            image: (future.data![index] as Map<String,
                                    dynamic>)['link_thumbnail_storage']
                                .toString(),
                            title: (future.data![index]
                                    as Map<String, dynamic>)['title']
                                .toString()))
                    // children: [],
                    );
              }
            }));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    VisualSummariesList(),
    Text('Index 1: Home'),
    Text('Index 2: Podcasts'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications clicked!')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Search clicked!')));
            },
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_widgetOptions.elementAt(_selectedIndex)],
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
      drawer: Drawer(),
    );
  }
}
