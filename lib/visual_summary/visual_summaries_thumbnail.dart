import 'package:emoroid_digest_app/utils/local_file.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../models/visual_summary.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class VisualSummaryThumbnail extends StatelessWidget with LocalFileSystem {
  const VisualSummaryThumbnail({
    Key? key,
    required this.visualSummary,
  }) : super(key: key);

  final VisualSummary visualSummary;

  Future<bool> downloadAndCompressThumbnail() async {
    String localThumbnailPath = getFilePath(visualSummary.linkVisualSummaryThumbnailStorage!);
    var mimeType = ".${localThumbnailPath.split('.').last}";
    if (mimeType == ".pdf") {
      return false;
    }
    if (await File(localThumbnailPath).exists()) {
      return true;
    }
    var tempPath = await getTempFilePath(visualSummary.linkVisualSummaryThumbnailStorage!);
    try {
      await Dio().download(visualSummary.linkVisualSummaryThumbnailSource!, tempPath);
    } catch (error) {
      return false;
    }

    if (!await File(localThumbnailPath).parent.exists()) {
      File(localThumbnailPath).parent.create();
    }

    await FlutterImageCompress.compressAndGetFile(
      File(tempPath).absolute.path,
      localThumbnailPath,
      format: mimeType == ".png" ? CompressFormat.png : CompressFormat.jpeg,
      quality: 1,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final localThumbnail = File(getFilePath(visualSummary.linkVisualSummaryThumbnailStorage!));
    return FutureBuilder(
        future: downloadAndCompressThumbnail(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (visualSummary.mimeTypeVisualSummaryThumbnail == "application/pdf") {
            if (snapshot.data! == false) {
              return SizedBox(
                  height: 240.0,
                  child: SfPdfViewer.network(visualSummary.linkVisualSummaryThumbnailSource!,
                      enableDoubleTapZooming: false));
            }
            return SizedBox(height: 240.0, child: SfPdfViewer.file(localThumbnail, enableDoubleTapZooming: false));
          } else {
            if (snapshot.data! == false) {
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
            return Image.file(localThumbnail);
          }
        });
  }
}
