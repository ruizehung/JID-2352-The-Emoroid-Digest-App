import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'model/visual_summary.dart';

class VisualSummaryDetailPage extends StatefulWidget {
  const VisualSummaryDetailPage(
      {super.key,
      required this.visualSummary,
      required this.setVisualSummarySelected});

  final VisualSummary visualSummary;
  final Function(VisualSummary? v) setVisualSummarySelected;

  @override
  State<VisualSummaryDetailPage> createState() =>
      _VisualSummaryDetailPageState();
}

class _VisualSummaryDetailPageState extends State<VisualSummaryDetailPage> {
  @override
  Widget build(BuildContext context) {
    bool isJpegOrPng =
        widget.visualSummary.linkSummaryStorage.endsWith('jpg') ||
            widget.visualSummary.linkSummaryStorage.endsWith('png');
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
            IconButton(
              onPressed: () {
                widget.setVisualSummarySelected(null);
              },
              icon: const Icon(Icons.arrow_back),
            )
          ]),
          Text(
            widget.visualSummary.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (isJpegOrPng)
            Image.network(widget.visualSummary.linkSummaryOriginal)
          else
            SizedBox(
                height: 240,
                child: SfPdfViewer.network(
                    widget.visualSummary.linkSummaryOriginal)),
          const Divider(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "FellowAuthor: ${widget.visualSummary.fellowAuthor}",
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        "Year guideline published: ${widget.visualSummary.yearGuidelinePublished}",
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text(
                        "Society: ${widget.visualSummary.giSocietyJournal}",
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    "Keywords: ${widget.visualSummary.keywords.join(", ")}",
                    textAlign: TextAlign.start,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
