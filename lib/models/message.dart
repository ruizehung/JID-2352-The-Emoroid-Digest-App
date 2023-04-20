import 'package:isar/isar.dart';
part 'message.g.dart';

@collection
class Message {
  late String id;
  Id get isarId => fastHash(id);
  late String title;
  late String body;
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