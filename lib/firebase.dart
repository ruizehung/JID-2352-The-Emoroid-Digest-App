// final List summaryList = readVisualSummariesFromFirestore();
import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoroid_digest_app/models/visual_summary.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

import 'isar_service.dart';

Future<void> syncVisualSummariesFromFirestore() async {
  final lastUpdateCloud = await FirebaseFirestore.instance.collection('Update').doc("lastUpdate").get();
  final visualSummariesLastUpdateTime = (lastUpdateCloud.data()!["visualSummaries"] as Timestamp).toDate();
  var lastUpdateLocal = await IsarService().getLastUpdate();

  if (lastUpdateLocal!.visualSummaries == null ||
      lastUpdateLocal.visualSummaries!.compareTo(visualSummariesLastUpdateTime) < 0) {
    CollectionReference collection = FirebaseFirestore.instance.collection('Visual Summaries');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collection.get();
    await Future.wait(querySnapshot.docs.map((doc) async {
      final data = (doc.data() as Map<String, dynamic>);
      IsarService().saveVisualSummary(VisualSummary()
        ..id = doc.id
        ..title = data['title']
        ..fellowAuthor = data['fellowAuthor']
        ..dateReleased = (data['dateReleased'] as Timestamp).toDate()
        ..guidelineAuthors = (data['guidelineAuthors'] as List<dynamic>).cast<String>()
        ..yearGuidelinePublished = data['yearGuidelinePublished']
        ..giSocietyJournal = (data['giSocietyJournal'] as List<dynamic>).cast<String>()
        ..organSystems = (data['organSystems'] as List<dynamic>).cast<String>()
        ..keywords = (data['keywords'] as List<dynamic>).cast<String>()
        ..recordedPodcastTitle = data['recordedPodcastTitle']
        ..linkOriginalManuscript = data['linkOriginalManuscript']
        ..linkTwitter = data['linkTwitter']
        ..mimeTypeVisualSummary = data['mimeTypeVisualSummary']
        ..mimeTypeVisualSummaryThumbnail = data['mimeTypeVisualSummaryThumbnail']
        ..mimeTypeVisualInfographic = data['mimeTypeVisualInfographic']
        ..mimeTypeVisualInfographicThumbnail = data['mimeTypeVisualInfographicThumbnail']
        ..linkVisualSummaryStorage = data['linkVisualSummaryStorage']
        ..linkVisualSummarySource = data['linkVisualSummarySource']
        ..linkVisualSummaryThumbnailStorage = data['linkVisualSummaryThumbnailStorage']
        ..linkVisualSummaryThumbnailSource = data['linkVisualSummaryThumbnailSource']
        ..linkVisualInfographicStorage = data['linkVisualInfographicStorage']
        ..linkVisualInfographicSource = data['linkVisualInfographicSource']
        ..linkVisualInfographicThumbnailStorage = data['linkVisualInfographicThumbnailStorage']
        ..linkVisualInfographicThumbnailSource = data['linkVisualInfographicThumbnailSource']);
    }));

    lastUpdateLocal.visualSummaries = visualSummariesLastUpdateTime;
    IsarService().saveLastUpdate(lastUpdateLocal);
  }
}

// Pass in "link_summary_storage" or "link_thumbnail_storage" field
Future<List?> downloadFileFromStorage(String path) async {
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
