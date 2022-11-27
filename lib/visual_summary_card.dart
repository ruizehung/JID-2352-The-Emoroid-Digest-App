import 'package:emoroid_digest_app/visual_summaries_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'firebase_interaction.dart';
import 'model/visual_summary.dart';

class VisualSummaryCard extends StatelessWidget {
  const VisualSummaryCard(
      {super.key,
      required this.visualSummary,
      required this.setVisualSummarySelected});

  final VisualSummary visualSummary;
  final Function(VisualSummary? v) setVisualSummarySelected;

  @override
  Widget build(BuildContext context) {
    bool isJpegOrPng = visualSummary.linkThumbnailStorage.endsWith('jpg') ||
        visualSummary.linkThumbnailStorage.endsWith('png');

    return InkWell(
        onTap: () {
          setVisualSummarySelected(visualSummary);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8),
          child: Card(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: [
                  Text(
                    visualSummary.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  if (isJpegOrPng)
                    Image.network(visualSummary.linkThumbnailOriginal)
                  else
                    FutureBuilder<List?>(
                        future: downloadFileFromStorage(
                            visualSummary.linkThumbnailStorage),
                        builder: (BuildContext context, AsyncSnapshot future) {
                          if (!future.hasData) {
                            return const Text("No image");
                          } else {
                            if (future.data != null &&
                                future.data[1] == 'application/pdf') {
                              return SizedBox(
                                  height: 240.0,
                                  child: SfPdfViewer.memory(future.data[0],
                                      enableDoubleTapZooming: false));
                            } else if (future.data != null &&
                                (future.data[1] == 'image/jpeg' ||
                                    future.data[1] == 'image/png')) {
                              return Image.memory(future.data[0]);
                            } else {
                              return const Text("no image data");
                            }
                          }
                        })
                  // Image(image: image)
                ],
              ))
            ],
          )),
        ));
  }
}
