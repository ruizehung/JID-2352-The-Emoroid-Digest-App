import 'package:emoroid_digest_app/visual_summary/visual_summary_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../models/visual_summary.dart';
import 'dart:io';

class Thumbnail extends StatelessWidget with LocalDocument {
  const Thumbnail({
    Key? key,
    required this.visualSummary,
  }) : super(key: key);

  final VisualSummary visualSummary;

  Future<File?> getVisualSummaryThumb(String fileName, String? fileType) async {
    if (fileType == null) {
      return null;
    }
    final exists =
        await File((await getFilePath("visual_summaries_thumb/$fileName.${fileType.split("/").last}"))).exists();
    if (!exists) {
      return null;
    }
    return File(await getFilePath("visual_summaries_thumb/$fileName.${fileType.split("/").last}"));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVisualSummaryThumb(visualSummary.title, visualSummary.mimeTypeVisualSummaryThumbnail),
        builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
          if (visualSummary.mimeTypeVisualSummaryThumbnail == "application/pdf") {
            if (snapshot.data == null) {
              return SizedBox(
                  height: 240.0,
                  child: SfPdfViewer.network(visualSummary.linkVisualSummaryThumbnailSource!,
                      enableDoubleTapZooming: false));
            } else {
              return SizedBox(height: 240.0, child: SfPdfViewer.file(snapshot.data!, enableDoubleTapZooming: false));
            }
          } else {
            if (snapshot.data == null) {
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
            } else {
              return Image.file(snapshot.data!);
            }
          }
        });
  }
}
