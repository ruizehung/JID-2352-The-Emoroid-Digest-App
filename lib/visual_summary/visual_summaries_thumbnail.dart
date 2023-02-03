import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../models/visual_summary.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key? key,
    required this.visualSummary,
  }) : super(key: key);

  final VisualSummary visualSummary;

  @override
  Widget build(BuildContext context) {
    if (visualSummary.mimeTypeVisualSummaryThumbnail == "application/pdf") {
      return SizedBox(
          height: 240.0,
          child: SfPdfViewer.network(visualSummary.linkVisualSummaryThumbnailSource!, enableDoubleTapZooming: false));
    }
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
}
