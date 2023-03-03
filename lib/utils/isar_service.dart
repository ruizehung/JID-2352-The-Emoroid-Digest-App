import 'package:emoroid_digest_app/models/last_update.dart';
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
    try {
      _db.writeTxnSync<int>(() => _db.podcasts.putSync(podcast));
    } catch (test) {
      print("Start");
      print("");
      print(podcast.id);
      print(podcast.title);
      print(podcast.dateReleased);
      print(podcast.twitterPodcastLink);
      print(podcast.guest);
      print(podcast.linkGuest);
      print(podcast.guidelineAuthors);
      print(podcast.yearGuidelinePublished);
      print(podcast.giSocietyJournal);
      print(podcast.organSystems);
      print(podcast.keywords);
      print(podcast.hasRead);
      print(podcast.isFavorite);
      print(test);
    }
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

  Set<String> getUniqueGISocietyJournal() {
    final set = <String>{};
    for (var vs in _db.visualSummarys.where().findAllSync()) {
      set.addAll(vs.giSocietyJournal);
    }
    return set;
  }

  Set<String> getUniqueKeywords() {
    final set = <String>{};
    for (var vs in _db.visualSummarys.where().findAllSync()) {
      set.addAll(vs.keywords);
    }
    return set;
  }

  Set<int> getUniqueYearGuidelinePublished() {
    final set = <int>{};
    for (var vs in _db.visualSummarys.where().findAllSync()) {
      set.add(vs.yearGuidelinePublished);
    }
    return set;
  }

  static Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [VisualSummarySchema, LastUpdateSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
