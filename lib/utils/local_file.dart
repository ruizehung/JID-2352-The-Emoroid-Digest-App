import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalFileSystem {
  static late String _localPath;
  static late String _tempPath;

  static Future<void> init() async {
    _localPath = (await getApplicationDocumentsDirectory()).path;
    _tempPath = (await getTemporaryDirectory()).path;
  }

  Future<Directory?> externalPath() async {
    return getExternalStorageDirectory();
  }

  String getFilePath(String fileName) {
    return '$_localPath/$fileName';
  }

  Future<String> getTempFilePath(String fileName) async {
    return '$_tempPath/$fileName';
  }

  // Future<String> getExternalPath(String fileName) async {
  //   String _tempPath = (await externalPath()).path;
  //   return '$_tempPath/$fileName';
  // }
}
