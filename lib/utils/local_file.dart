import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalFileSystem {
  static late String _localPath;

  static Future<void> init() async {
    _localPath = (await getApplicationDocumentsDirectory()).path;
  }

  Future<String> tempPath() async {
    return (await getTemporaryDirectory()).path;
  }

  String getFilePath(String fileName) {
    return '$_localPath/$fileName';
  }

  String getVisualSummaryThumbnailCompressedPath(String fileName) {
    return '$_localPath/VisualSummaryThumbnailCompressed/$fileName';
  }

  Future<String> getTempFilePath(String fileName) async {
    // ignore: no_leading_underscores_for_local_identifiers
    String _tempPath = await tempPath();
    return '$_tempPath/$fileName';
  }
}
