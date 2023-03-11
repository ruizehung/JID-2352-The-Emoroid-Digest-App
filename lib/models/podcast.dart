import 'package:isar/isar.dart';
part 'podcast.g.dart';

@collection
class Podcast {
  String? id;
  Id get isarId => fastHash(id!);

  late String title;
  late DateTime dateReleased;
  late String twitterPodcastLink;
  late String guest;
  late String linkGuest;
  late List<String> guidelineAuthors;
  late int yearGuidelinePublished;
  late String giSocietyJournal;
  late List<String> organSystems;
  late List<String> keywords;
  String? mediaUrl;
  String? mediaStorage;
  late bool hasListened = false;
  late bool isFavorite = false;
  late int? currentDuration = null;
  late int? totalDuration = null;

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
