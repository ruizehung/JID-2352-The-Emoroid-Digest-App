import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/visual_summary.dart';

class VisualSummaryDetailPage extends StatefulWidget {
  const VisualSummaryDetailPage({super.key, required this.visualSummary, required this.setVisualSummarySelected});

  final VisualSummary visualSummary;
  final Function(VisualSummary? v) setVisualSummarySelected;

  @override
  State<VisualSummaryDetailPage> createState() => _VisualSummaryDetailPageState();
}

class _VisualSummaryDetailPageState extends State<VisualSummaryDetailPage> {
  final double iconSize = 30;
  final double fieldFontSize = 16;

  Widget detailField(String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: fieldFontSize,
                fontWeight: FontWeight.bold,
              ),
            )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: fieldFontSize,
                ),
              ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
            if (widget.visualSummary.mimeTypeVisualSummary == "application/pdf")
              SizedBox(height: 240, child: SfPdfViewer.network(widget.visualSummary.linkVisualSummarySource!))
            else
              Image.network(widget.visualSummary.linkVisualSummarySource!),
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
                            semanticLabel: 'Text to announce in accessibility modes',
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
                          onPressed: () async {
                            final uri = Uri.parse(widget.visualSummary.linkOriginalManuscript);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              throw 'Could not launch ${widget.visualSummary.linkOriginalManuscript}';
                            }
                          },
                          icon: const Icon(Icons.description_outlined),
                          iconSize: iconSize,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined),
                          iconSize: iconSize,
                        ),
                        /*If link ? blue button : gray button */
                        const SizedBox(width: 10),
                        if (widget.visualSummary.linkTwitter != null)
                          IconButton(
                            //Button to jump to twitter for discussion
                            onPressed: () async {
                              print(widget.visualSummary.linkTwitter.toString());
                              final url = widget.visualSummary.linkTwitter.toString();
                              final uri = Uri.parse(widget.visualSummary.linkTwitter.toString());
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                // can't launch url, there is some error
                                throw "Could not launch $url";
                              }
                            },
                            icon: const Icon(FontAwesomeIcons.squareTwitter, color: Colors.blue),
                            iconSize: iconSize,
                          )
                        // else
                        //   IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(FontAwesomeIcons.squareTwitter, color: Colors.grey),
                        //     iconSize: iconSize,
                        //   ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    detailField("Year Guideline Published", "${widget.visualSummary.yearGuidelinePublished}"),
                    detailField("Society", widget.visualSummary.giSocietyJournal),
                    detailField("Organ Systems", widget.visualSummary.organSystems.join(", ")),
                    detailField("Keywords", widget.visualSummary.keywords.join(", ")),
                    detailField("Guideline Authors (First two and last listed author)",
                        widget.visualSummary.guidelineAuthors.join(", ")),
                    detailField(
                        "Recorded Podcast",
                        widget.visualSummary.recordedPodcastTitle == null
                            ? "N/A"
                            : widget.visualSummary.recordedPodcastTitle!),
                    detailField("Visual Summary Fellow Author", widget.visualSummary.fellowAuthor!),
                    detailField("Visual Summary Release Date",
                        "${widget.visualSummary.dateReleased.year.toString()}-${widget.visualSummary.dateReleased.month.toString().padLeft(2, '0')}-${widget.visualSummary.dateReleased.day.toString().padLeft(2, '0')}"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
