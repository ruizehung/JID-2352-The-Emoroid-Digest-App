import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:emoroid_digest_app/models/podcast.dart';
import 'package:emoroid_digest_app/models/visual_summary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime/mime.dart';

import 'isar_service.dart';

Future<void> syncPodcastsFromFirestore() async {
  final lastUpdateCloud = await FirebaseFirestore.instance.collection('Last Update').doc("lastUpdate").get();
  final podcastsLastUpdateTime = (lastUpdateCloud.data()!["podcasts"] as Timestamp).toDate();
  var lastUpdateLocal = await IsarService().getLastUpdate();

  if (lastUpdateLocal.podcasts == null || lastUpdateLocal.podcasts!.compareTo(podcastsLastUpdateTime) < 0) {
    CollectionReference collection = FirebaseFirestore.instance.collection('Podcasts');
    List<Podcast> localPodcasts = await IsarService().getAllPodcasts();
    Set<String> localPodcastIDs = <String>{};
    for (Podcast p in localPodcasts) {
      localPodcastIDs.add(p.id!);
    }

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collection.get();
    await Future.wait(querySnapshot.docs.map((doc) async {
      final data = (doc.data() as Map<String, dynamic>);
      localPodcastIDs.remove(doc.id);
      Podcast p = Podcast()
        ..id = doc.id
        ..title = data['title']
        ..dateReleased = (data['date_released'] as Timestamp).toDate()
        ..twitterPodcastLink = data['twitterPodcastLink']
        ..guest = data['guest']
        ..linkGuest = data['link_guest']
        ..guidelineAuthors = (data['guidelineAuthors'] as List<dynamic>).cast<String>()
        ..yearGuidelinePublished = data['yearGuidelinePublished']
        ..giSocietyJournal = (data['giSocietyJournal'] as List<dynamic>).cast<String>()
        ..organSystems = (data['organSystems'] as List<dynamic>).cast<String>()
        ..keywords = (data['keywords'] as List<dynamic>).cast<String>()
        ..mediaUrl = data['media_url']
        ..mediaStorage = data['media_storage']
        ..hasListened = false
        ..isFavorite = false;

      IsarService().savePodcast(p);
    }));

    // Delete podcasts that are no longer in the collection
    for (String id in localPodcastIDs) {
      IsarService().deletePodcast(id);
    }

    lastUpdateLocal.podcasts = podcastsLastUpdateTime;
    IsarService().saveLastUpdate(lastUpdateLocal);
  }
}

Future<void> syncVisualSummariesFromFirestore() async {
  final lastUpdateCloud = await FirebaseFirestore.instance.collection('Last Update').doc("lastUpdate").get();
  final visualSummariesLastUpdateTime = (lastUpdateCloud.data()!["visualSummaries"] as Timestamp).toDate();
  var lastUpdateLocal = await IsarService().getLastUpdate();

  if (lastUpdateLocal!.visualSummaries == null ||
      lastUpdateLocal.visualSummaries!.compareTo(visualSummariesLastUpdateTime) < 0) {
    List<VisualSummary> localVisualSummaries = await IsarService().getAllVisualSummaries();
    Set<String> localVisualSummaryIDs = <String>{};
    for (VisualSummary vs in localVisualSummaries) {
      localVisualSummaryIDs.add(vs.id!);
    }

    CollectionReference collection = FirebaseFirestore.instance.collection('Visual Summaries');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collection.get();
    await Future.wait(querySnapshot.docs.map((doc) async {
      final data = (doc.data() as Map<String, dynamic>);
      localVisualSummaryIDs.remove(doc.id);
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
        ..linkVisualSummaryStorage = data['linkVisualSummaryStorage']
        ..linkVisualSummarySource = data['linkVisualSummarySource']
        ..linkVisualSummaryThumbnailStorage = data['linkVisualSummaryThumbnailStorage']
        ..linkVisualSummaryThumbnailSource = data['linkVisualSummaryThumbnailSource']);
    }));

    // Delete visual summaries that are no longer in the collection
    for (String id in localVisualSummaryIDs) {
      IsarService().deleteVisualSummary(id);
    }

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

Future<String> getPrivacyPolicyURLFromFirestore() async {
  final privacyDoc = await FirebaseFirestore.instance.collection('Privacy Policy').doc("privacy_policy").get();
  return privacyDoc.get("url") as String;
}

Future<void> addFeedback(Map<String, String> feedback) async {
  try {
    final result = await FirebaseFunctions.instanceFor(app: Firebase.app("Emroid-Digest-App"), region: "us-central1").httpsCallable('addFeedback').call(feedback);
    print("addFeedback response: ${result.data as String}");
  } on FirebaseFunctionsException catch (error) {
    print("addFeedback error: ${error.message}");
  }
}