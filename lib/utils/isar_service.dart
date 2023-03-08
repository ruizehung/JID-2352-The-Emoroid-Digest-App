import 'package:emoroid_digest_app/models/last_update.dart';
import 'package:emoroid_digest_app/models/master.dart';
import 'package:emoroid_digest_app/models/podcast.dart';
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

  VisualSummary? getVisualSummary(String id) {
    return _db.visualSummarys.filter().idEqualTo(id).findFirstSync();
  }

  Podcast? getPodcast(String id) {
    return _db.podcasts.filter().idEqualTo(id).findFirstSync();
  }

  void saveLastUpdate(LastUpdate lastUpdate) {
    _db.writeTxnSync<int>(() => _db.lastUpdates.putSync(lastUpdate));
  }

  void saveVisualSummary(VisualSummary visualSummary) {
    _db.writeTxnSync<int>(() => _db.visualSummarys.putSync(visualSummary));
  }

  void savePodcast(Podcast podcast) {
    _db.writeTxnSync<int>(() => _db.podcasts.putSync(podcast));
  }

  Future<LastUpdate?> getLastUpdate() async {
    if (await _db.lastUpdates.filter().idEqualTo(0).findFirst() == null) {
      _db.writeTxnSync<int>(() => _db.lastUpdates.putSync(LastUpdate()));
    }
    return await _db.lastUpdates.filter().idEqualTo(0).findFirst();
  }

  Future<List<VisualSummary>> getVisualSummariesWithThumbnail() async {
    return await _db.visualSummarys.filter().linkVisualSummaryThumbnailSourceIsNotNull().findAll();
  }

  Future<List<Podcast>> getPodcasts() async {
    return await _db.podcasts.filter().idIsNotNull().findAll();
  }

  Future<List<VisualSummary>> getDownloadedVisualSummaries() async {
    return await _db.visualSummarys.filter().isDownloadedEqualTo(true).findAll();
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

  Set<String> getUniquePodcastsGISocietyJournal() {
    final set = <String>{};
    for (var p in _db.podcasts.where().findAllSync()) {
      set.add(p.giSocietyJournal);
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

  Future<List<VisualSummary>> getVisualSummariesResultAfterSearch(value) async {
    return await _db.visualSummarys
        .filter()
        .titleContains(value, false, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll();
  }

  Future<List<Podcast>> getPodcastsResultAfterSearch(value) async {
    return await _db.podcasts
        .filter()
        .titleContains(value, caseSensitive: false)
        .sortByYearGuidelinePublishedDesc()
        .findAll();
  }

  //List of all Visual Summaries and Podcasts
  Future<List<Master>> getMasterList(value) async {
    Set<Master> msSet = Set();
    if (value.isEmpty) {
      await getPodcasts().then((value) => msSet.addAll(value));
      await getVisualSummariesWithThumbnail().then((value) => msSet.addAll(value));
    } else {
      await getPodcastsResultAfterSearch(value).then((value) => msSet.addAll(value));
      await getVisualSummariesResultAfterSearch(value).then((value) => msSet.addAll(value));
    }
    List<Master> ms = msSet.toList();
    return ms;
  }

  Set<int> getUniquePodcastsYearGuidelinePublished() {
    final set = <int>{};
    for (var p in _db.podcasts.where().findAllSync()) {
      set.add(p.yearGuidelinePublished);
    }
    return set;
  }

  static Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [VisualSummarySchema, PodcastSchema, LastUpdateSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
