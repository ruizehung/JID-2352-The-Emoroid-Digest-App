// final List summaryList = readVisualSummariesFromFirestore();
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoroid_digest_app/models/visual_summary.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

Future<List<VisualSummary>> readVisualSummariesFromFirestore() async {
  debugPrint("readVisualSummariesFromFirestore() called");
  CollectionReference visualSummariesRef =
      FirebaseFirestore.instance.collection('Visual Summaries');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await visualSummariesRef.get();
  // Get data from docs and convert map to List
  final visualSummariesFromFirestore =
      querySnapshot.docs.map((doc) => doc.data()).toList();
  List<VisualSummary> visualSummaries = [];

  for (var visualSummary in visualSummariesFromFirestore) {
    if (visualSummary != null &&
        (visualSummary
                as Map<String, dynamic>)["linkVisualSummaryThumbnailSource"] !=
            "") {
      visualSummaries.add(VisualSummary.fromJson(visualSummary));
    }
  }
  visualSummaries.sort((a, b) => -a.dateReleased.compareTo(b.dateReleased));
  return visualSummaries;
}

// Pass in "link_summary_storage" or "link_thumbnail_storage" field
Future<List?> downloadFileFromStorage(String path) async {
  // Get storage reference
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
