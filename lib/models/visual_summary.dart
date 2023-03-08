import 'package:emoroid_digest_app/models/master.dart';
import 'package:isar/isar.dart';
part 'visual_summary.g.dart';

@collection
class VisualSummary extends Master {
  String? id;
  Id get isarId => fastHash(id!);

  late String title;
  late String fellowAuthor;
  late DateTime dateReleased;
  late List<String> guidelineAuthors;
  late int yearGuidelinePublished;
  late List<String> giSocietyJournal;
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
  late bool isDownloaded = false;
  late bool hasRead = false;
  late bool isFavorite = false;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get contentTitle => title.split(' ');
}

/// FNV-1a 64bit hash algorithm optimized for Dart Strings
/// https://isar.dev/recipes/string_ids.html
int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
