import 'package:emoroid_digest_app/visual_summary/visual_summary_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../models/visual_summary.dart';
import 'dart:io';

class VisualSummaryThumbnail extends StatelessWidget with LocalDocument {
  const VisualSummaryThumbnail({
    Key? key,
    required this.visualSummary,
  }) : super(key: key);

  final VisualSummary visualSummary;

  Future<File?> getVisualSummaryThumb(String fileName) async {
    final exists = await File((await getFilePath(fileName))).exists();
    if (!exists) {
      return File("None");
    }
    return File((await getFilePath(fileName)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVisualSummaryThumb(visualSummary.linkVisualSummaryThumbnailStorage!),
        builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (visualSummary.mimeTypeVisualSummaryThumbnail == "application/pdf") {
            if (snapshot.data!.path == "None") {
              return SizedBox(
                  height: 240.0,
                  child: SfPdfViewer.network(visualSummary.linkVisualSummaryThumbnailSource!,
                      enableDoubleTapZooming: false));
            }
            return SizedBox(height: 240.0, child: SfPdfViewer.file(snapshot.data!, enableDoubleTapZooming: false));
          } else {
            if (snapshot.data!.path == "None") {
              return Image.network(visualSummary.linkVisualSummaryThumbnailSource!,
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  });
            }
            return Image.file(snapshot.data!);
          }
        });
  }
}
