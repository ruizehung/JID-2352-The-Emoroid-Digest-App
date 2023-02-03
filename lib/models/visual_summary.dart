import 'package:isar/isar.dart';
part 'visual_summary.g.dart';

@collection
class VisualSummary {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? firestoreDocID;

  late String title;
  late String fellowAuthor;
  late DateTime dateReleased;
  late List<String> guidelineAuthors;
  late int yearGuidelinePublished;
  late String giSocietyJournal;
  late List<String> organSystems;
  late List<String> keywords;
  String? recordedPodcastTitle;
  late String linkOriginalManuscript;
  String? linkTwitter;
  String? mimeTypeVisualSummary;
  String? mimeTypeVisualSummaryThumbnail;
  String? mimeTypeVisualInfographic;
  String? mimeTypeVisualInfographicThumbnail;
  String? linkVisualSummaryStorage;
  String? linkVisualSummarySource;
  String? linkVisualSummaryThumbnailStorage;
  String? linkVisualSummaryThumbnailSource;
  String? linkVisualInfographicStorage;
  String? linkVisualInfographicSource;
  String? linkVisualInfographicThumbnailStorage;
  String? linkVisualInfographicThumbnailSource;
}
