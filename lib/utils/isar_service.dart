import 'dart:async';

import 'package:emoroid_digest_app/models/last_update.dart';
import 'package:emoroid_digest_app/models/search_result_item.dart';
import 'package:emoroid_digest_app/models/podcast.dart';
import 'package:emoroid_digest_app/models/message.dart';
import 'package:emoroid_digest_app/models/visual_summary.dart';
import 'package:isar/isar.dart';

class IsarService {
  static late IsarService _instance;
  static late Isar _db;

  static void init() async {
    _db = await _openDB();
    _instance = IsarService._internal();
  }

  factory IsarService() {
    return _instance;
  }

  IsarService._internal();

  // ******************* Search *******************

  Future<List<VisualSummary>> getVisualSummariesResultAfterSearch(String value) async {
    Set<VisualSummary> vsSet = {};
    await _db.visualSummarys
        .filter()
        .titleContains(value, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll()
        .then((visualSummaries) {
      for (var vs in visualSummaries) {
        vsSet.add(vs);
      }
    });
    await _db.visualSummarys
        .filter()
        .keywordsElementContains(value, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll()
        .then((visualSummaries) {
      for (var vs in visualSummaries) {
        vsSet.add(vs);
      }
    });
    await _db.visualSummarys
        .filter()
        .organSystemsElementContains(value, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll()
        .then((visualSummaries) {
      for (var vs in visualSummaries) {
        vsSet.add(vs);
      }
    });
    return vsSet.toSet().toList();
  }

  Future<List<Podcast>> getPodcastsResultAfterSearch(String value) async {
    Set<Podcast> pSet = {};
    await _db.podcasts
        .filter()
        .titleContains(value, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll()
        .then((podcasts) {
      for (var p in podcasts) {
        pSet.add(p);
      }
    });
    await _db.podcasts
        .filter()
        .keywordsElementContains(value, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll()
        .then((podcasts) {
      for (var p in podcasts) {
        pSet.add(p);
      }
    });
    await _db.podcasts
        .filter()
        .organSystemsElementContains(value, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll()
        .then((podcasts) {
      for (var p in podcasts) {
        pSet.add(p);
      }
    });
    return pSet.toSet().toList();
  }

  //List of all Visual Summaries and Podcasts
  Future<List<SearchResultItem>> getSearchResultItems(String value) async {
    Set<SearchResultItem> msSet = {};
    if (value.isEmpty) {
      await getPodcasts().then((podcasts) {
        for (var p in podcasts) {
          msSet.add(SearchResultItem()..podcast = p);
        }
      });
      await getVisualSummariesWithThumbnail().then((visualSummaries) {
        for (var vs in visualSummaries) {
          msSet.add(SearchResultItem()..visualSummary = vs);
        }
      });
    } else {
      await getPodcastsResultAfterSearch(value).then((podcasts) {
        for (var p in podcasts) {
          msSet.add(SearchResultItem()..podcast = p);
        }
      });
      await getVisualSummariesResultAfterSearch(value).then((visualSummaries) {
        for (var vs in visualSummaries) {
          msSet.add(SearchResultItem()..visualSummary = vs);
        }
      });
    }
    return msSet.toList();
  }

  // ******************* VisualSummary *******************

  VisualSummary? getVisualSummary(String id) {
    return _db.visualSummarys.filter().idEqualTo(id).findFirstSync();
  }

  void deleteVisualSummary(String id) {
    _db.writeTxnSync<int>(() => _db.visualSummarys.filter().idEqualTo(id).deleteAllSync());
  }

  List<VisualSummary> getVisualSummaryWithPodcastTitle(String podcastTitle) {
    return _db.visualSummarys.filter().recordedPodcastTitleEqualTo(podcastTitle).findAllSync();
  }

  void saveVisualSummary(VisualSummary visualSummary) {
    _db.writeTxnSync<int>(() => _db.visualSummarys.putSync(visualSummary));
  }

  Future<List<VisualSummary>> getVisualSummariesWithThumbnail() {
    return _db.visualSummarys.filter().linkVisualSummaryThumbnailSourceIsNotNull().findAll();
  }

  Future<List<VisualSummary>> getDownloadedVisualSummaries() async {
    return _db.visualSummarys.filter().isDownloadedEqualTo(true).findAll();
  }

  Future<List<VisualSummary>> getAllVisualSummaries() async {
    return _db.visualSummarys.filter().idIsNotNull().findAll();
  }

  Set<String> getUniqueOrganSystems() {
    final set = <String>{};
    for (var vs in _db.visualSummarys.where().findAllSync()) {
      set.addAll(vs.organSystems);
    }
    return set;
  }

  Set<String> getUniqueVisualSummariesGISocietyJournal() {
    final set = <String>{};
    for (var vs in _db.visualSummarys.where().findAllSync()) {
      set.addAll(vs.giSocietyJournal);
    }
    return set;
  }

  Set<String> getUniqueVisualSummariesKeywords() {
    final set = <String>{};
    for (var vs in _db.visualSummarys.where().findAllSync()) {
      set.addAll(vs.keywords);
    }
    return set;
  }

  // ******************* Podcast *******************

  Podcast? getPodcast(String id) {
    return _db.podcasts.filter().idEqualTo(id).findFirstSync();
  }

  Future<List<Podcast>> getAllPodcasts() async {
    return _db.podcasts.filter().idIsNotNull().findAll();
  }

  void deletePodcast(String id) {
    _db.writeTxnSync<int>(() => _db.podcasts.filter().idEqualTo(id).deleteAllSync());
  }

  void savePodcast(Podcast podcast) {
    _db.writeTxnSync<int>(() => _db.podcasts.putSync(podcast));
  }

  Podcast? getPodcastByTitle(String title) {
    return _db.podcasts.filter().titleEqualTo(title).findFirstSync();
  }

  Future<List<Podcast>> getPodcasts() async {
    return await _db.podcasts.filter().idIsNotNull().findAll();
  }

  Set<String> getUniquePodcastsKeywords() {
    final set = <String>{};
    for (var p in _db.podcasts.where().findAllSync()) {
      set.addAll(p.keywords);
    }
    return set;
  }

  Set<int> getUniqueVisualSummariesYearGuidelinePublished() {
    final set = <int>{};
    for (var vs in _db.visualSummarys.where().findAllSync()) {
      set.add(vs.yearGuidelinePublished);
    }
    return set;
  }

  Set<int> getUniquePodcastsYearGuidelinePublished() {
    final set = <int>{};
    for (var p in _db.podcasts.where().findAllSync()) {
      set.add(p.yearGuidelinePublished);
    }
    return set;
  }

  Set<String> getUniquePodcastsGISocietyJournal() {
    final set = <String>{};
    for (var p in _db.podcasts.where().findAllSync()) {
      set.addAll(p.giSocietyJournal);
    }
    return set;
  }

  // ******************* Message *******************
  StreamController<int> countController = StreamController<int>.broadcast();

  void saveMessage(Message message) {
    _db.writeTxnSync<int>(() => _db.messages.putSync(message));
    countController.sink.add(getMessages().length);
  }

  List<Message> getMessages() {
    return _db.messages.where().findAllSync();
  }

  void clearMessages() async {
    _db.writeTxnSync(() => _db.messages.clearSync());
    countController.sink.add(0);
  }

  Stream<int> getMessageCountStream() {
    return countController.stream;
  }

  // Last Update
  void saveLastUpdate(LastUpdate lastUpdate) {
    _db.writeTxnSync<int>(() => _db.lastUpdates.putSync(lastUpdate));
  }

  Future<LastUpdate> getLastUpdate() async {
    if (await _db.lastUpdates.filter().idEqualTo(0).findFirst() == null) {
      _db.writeTxnSync<int>(() => _db.lastUpdates.putSync(LastUpdate()));
    }
    return (await _db.lastUpdates.filter().idEqualTo(0).findFirst())!;
  }

  static Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [VisualSummarySchema, PodcastSchema, LastUpdateSchema, MessageSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
