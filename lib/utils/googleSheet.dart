import 'package:emoroid_digest_app/models/feedback_model.dart';
import 'package:gsheets/gsheets.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class GoogleSheet {
  static String _credentials = "";

  static const _sheetId = '1HSHdN_IxuL4sKaPvazovcZYiEcQJVS7lAGhb2pe8Jv4';

  static Worksheet? _feedbackSheet;

  static Future init() async {
    final api = await getGoogleMapsApiKey();
    _credentials = api;

    final gsheet = GSheets(_credentials);
    final sheet = await gsheet.spreadsheet(_sheetId);
    _feedbackSheet = await _getWorkSheet(sheet, title: 'Sheet1');

    try {
      final firstRow = FeedbackModel.getFields();
      _feedbackSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print("Error with  adding first row");
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet sheet, {required String title}) async {
    try {
      return await sheet.addWorksheet(title);
    } catch (e) {
      return sheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_feedbackSheet == null) {
      return;
    }
    _feedbackSheet!.values.map.appendRows(rowList);
  }

  static Future<String> getGoogleMapsApiKey() async {
    final jsonString = await rootBundle.loadString('assets/google_sheet_key.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final apiKey = json.encode(jsonMap);
    return apiKey;
  }
}
