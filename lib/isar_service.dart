import 'package:emoroid_digest_app/models/last_update.dart';
import 'package:emoroid_digest_app/models/visual_summary.dart';
import 'package:isar/isar.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();
  late Future<Isar> db;

  factory IsarService() {
    return _instance;
  }

  IsarService._internal() {
    // initialization logic
    db = openDB();
  }

  Future<void> saveLastUpdate(LastUpdate lastUpdate) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.lastUpdates.putSync(lastUpdate));
  }

  Future<void> saveVisualSummary(VisualSummary visualSummary) async {
    final isar = await db;
    final vs = await isar.visualSummarys.filter().firestoreDocIDEqualTo(visualSummary.firestoreDocID).findFirst();
    if (vs != null) {
      visualSummary.id = vs.id;
    }
    isar.writeTxnSync<int>(() => isar.visualSummarys.putSync(visualSummary));
  }

  Future<LastUpdate?> getLastUpdate() async {
    final isar = await db;
    if (await isar.lastUpdates.filter().idEqualTo(0).findFirst() == null) {
      isar.writeTxnSync<int>(() => isar.lastUpdates.putSync(LastUpdate()));
    }
    return await isar.lastUpdates.filter().idEqualTo(0).findFirst();
  }

  Future<List<VisualSummary>> getAllVisualSummariesWithThumbnail() async {
    final isar = await db;
    return await isar.visualSummarys.filter().linkVisualSummaryThumbnailSourceIsNotNull().findAll();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [VisualSummarySchema, LastUpdateSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
