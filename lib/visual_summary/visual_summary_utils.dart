import 'dart:async';
import 'package:path_provider/path_provider.dart';

mixin LocalDocument {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<String> getFilePath(String fileName) async {
    final path = await _localPath;
    return '$path/$fileName';
  }
}
