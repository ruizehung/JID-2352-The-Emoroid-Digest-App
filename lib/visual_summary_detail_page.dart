import 'package:flutter/cupertino.dart';
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
  final double iconSize = 30;
  @override
  Widget build(BuildContext context) {
    bool isJpegOrPng =
        widget.visualSummary.linkSummaryStorage.endsWith('jpg') ||
            widget.visualSummary.linkSummaryStorage.endsWith('png');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          children: [
            Row(children: [
              IconButton(
                onPressed: () {
                  widget.setVisualSummarySelected(null);
                },
                icon: const Icon(Icons.arrow_circle_left_outlined),
                iconSize: 36,
              )
            ]),
            Text(
              widget.visualSummary.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            if (isJpegOrPng)
              Image.network(widget.visualSummary.linkSummaryOriginal)
            else
              SizedBox(
                  height: 240,
                  child: SfPdfViewer.network(
                      widget.visualSummary.linkSummaryOriginal)),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.heart,
                            color: Colors.black,
                            size: iconSize,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          iconSize: iconSize,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.file_download_outlined),
                          iconSize: iconSize,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined),
                          iconSize: iconSize,
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Fellow Author",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.visualSummary.fellowAuthor,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Text(
                          "Year Guideline Published",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.visualSummary.yearGuidelinePublished}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Text(
                          "Society",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.visualSummary.giSocietyJournal,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Text(
                          "Keywords",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.visualSummary.keywords.join(", "),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
