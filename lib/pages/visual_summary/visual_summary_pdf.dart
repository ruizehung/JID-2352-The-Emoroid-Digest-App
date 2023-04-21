import 'dart:io';
import 'package:emoroid_digest_app/utils/local_file.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../utils/isar_service.dart';

class VisualSummaryPDFPageArguments {
  VisualSummaryPDFPageArguments();
}

class VisualSummaryPDFPage extends StatelessWidget with LocalFileSystem {
  const VisualSummaryPDFPage({super.key, required this.visualSummaryID});
  final String visualSummaryID;

  @override
  Widget build(BuildContext context) {
    final visualSummary = IsarService.instance.getVisualSummary(visualSummaryID);
    if (visualSummary == null) {
      return Text("Unknown visual summary ID: $visualSummaryID");
    }
    File localVisualSummary = File(getFilePath(visualSummary.linkVisualSummaryStorage!));

    return Scaffold(
      appBar: AppBar(
        title: Text(visualSummary.title),
      ),
      body: FutureBuilder(
          future: localVisualSummary.exists(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (visualSummary.mimeTypeVisualSummary == "application/pdf") {
              if (snapshot.data! == false) {
                return SfPdfViewer.network(
                  visualSummary.linkVisualSummarySource!,
                  onDocumentLoadFailed: (details) async {
                    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("No internet connection. Failed to load PDF."),
                          ),
                        );
                      }
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(details.description)));
                      }
                    }
                  },
                );
              } else {
                return SfPdfViewer.file(localVisualSummary);
              }
            } else {
              if (snapshot.data! == false) {
                return Image.network(visualSummary.linkVisualSummarySource!);
              } else {
                return Image.file(localVisualSummary);
              }
            }
          }),
    );
  }
}
