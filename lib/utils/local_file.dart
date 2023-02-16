import 'dart:async';
import 'package:path_provider/path_provider.dart';

class LocalFileSystem {
  static late String _localPath;

  static Future<void> init() async {
    _localPath = (await getApplicationDocumentsDirectory()).path;
  }

  String getFilePath(String fileName) {
    return '$_localPath/$fileName';
  }
}
