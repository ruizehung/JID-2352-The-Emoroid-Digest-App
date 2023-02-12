import 'package:emoroid_digest_app/visual_summary/visual_summary_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../models/visual_summary.dart';

import '../isar_service.dart';

class VisualSummaryDetailPage extends StatefulWidget {
  const VisualSummaryDetailPage({super.key, required this.visualSummary, required this.setVisualSummarySelected});

  final VisualSummary visualSummary;
  final Function(VisualSummary? v) setVisualSummarySelected;

  @override
  State<VisualSummaryDetailPage> createState() => _VisualSummaryDetailPageState();
}

class _VisualSummaryDetailPageState extends State<VisualSummaryDetailPage> with LocalDocument {
  final double iconSize = 30;
  final double fieldFontSize = 16;
  Future<File?> getVisualSummary(String fileName, String? fileType) async {
    if (fileType == null) {
      return null;
    }
    final exists = await File((await getFilePath("visual_summaries/$fileName.${fileType.split("/").last}"))).exists();
    if (!exists) {
      return null;
    }
    return File(await getFilePath("visual_summaries/$fileName.${fileType.split("/").last}"));
  }

  Future<void> downloadVisualSummary(String? linkVisualSummarySource, String? linkVisualSummaryThumbnailSource,
      String fileName, String? fileType, String? fileTypeThumb) async {
    if (fileType == null ||
        linkVisualSummarySource == null ||
        linkVisualSummaryThumbnailSource == null ||
        fileTypeThumb == null) {
      return;
    }
    List<String> filesToDownload = [];
    filesToDownload.add(await getFilePath("visual_summaries/"));
    filesToDownload.add(await getFilePath("visual_summaries_thumb/"));
    for (var i = 0; i < filesToDownload.length; i++) {
      final savedDir = Directory(filesToDownload[i]);
      bool hasExisted = await savedDir.exists();
      if (!hasExisted) {
        await savedDir.create();
      }
      final taskId = await FlutterDownloader.enqueue(
        url: i == 0 ? linkVisualSummarySource : linkVisualSummaryThumbnailSource,
        fileName: "$fileName.${(i == 0 ? fileType : fileTypeThumb).split("/").last}",
        savedDir: filesToDownload[i],
      );
    }
    return;
  }

  Future<void> deleteVisualSummary(String fileName, String? fileType, String? fileTypeThumb) async {
    if (fileType == null || fileTypeThumb == null) {
      return;
    }
    List<File> filesToDelete = [];
    filesToDelete.add(File(await getFilePath("visual_summaries/$fileName.${fileType.split("/").last}")));
    filesToDelete.add(File(await getFilePath("visual_summaries_thumb/$fileName.${fileTypeThumb.split("/").last}")));
    for (var i = 0; i < filesToDelete.length; i++) {
      try {
        if (await filesToDelete[i].exists()) {
          await filesToDelete[i].delete();
        }
      } catch (error) {
        print(error);
      }
    }
  }

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
            FutureBuilder(
                future: getVisualSummary(widget.visualSummary.title, widget.visualSummary.mimeTypeVisualSummary),
                builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
                  if (widget.visualSummary.mimeTypeVisualSummary == "application/pdf") {
                    if (snapshot.data == null) {
                      return SizedBox(
                          height: 240, child: SfPdfViewer.network(widget.visualSummary.linkVisualSummarySource!));
                    } else {
                      return SizedBox(height: 240, child: SfPdfViewer.file(snapshot.data!));
                    }
                  } else {
                    if (snapshot.data == null) {
                      return Image.network(widget.visualSummary.linkVisualSummarySource!);
                    } else {
                      return Image.file(snapshot.data!);
                    }
                  }
                }),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.visualSummary.readStatus) {
                                widget.visualSummary.readStatus = false;
                              } else {
                                widget.visualSummary.readStatus = true;
                              }
                            });
                            IsarService().saveVisualSummary(widget.visualSummary);
                          },
                          icon: Icon(
                            CupertinoIcons.eye,
                            color: widget.visualSummary.readStatus ? Colors.green : Colors.black,
                            size: iconSize,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                          iconSize: iconSize,
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.visualSummary.starStatus = !widget.visualSummary.starStatus;
                            });
                            IsarService().saveVisualSummary(widget.visualSummary);
                          },
                          icon: Icon(
                            widget.visualSummary.starStatus ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                            color: widget.visualSummary.starStatus ? Colors.pink : Colors.black,
                            size: iconSize,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                          iconSize: iconSize,
                        ),
                        const SizedBox(width: 10),
                        FutureBuilder(
                            future: getVisualSummary(
                                widget.visualSummary.title, widget.visualSummary.mimeTypeVisualSummary),
                            builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
                              if (snapshot.data == null) {
                                return IconButton(
                                  onPressed: () async {
                                    downloadVisualSummary(
                                        widget.visualSummary.linkVisualSummarySource,
                                        widget.visualSummary.linkVisualSummaryThumbnailSource,
                                        widget.visualSummary.title,
                                        widget.visualSummary.mimeTypeVisualSummary,
                                        widget.visualSummary.mimeTypeVisualSummaryThumbnail);
                                  },
                                  icon: const Icon(Icons.file_download_outlined),
                                  iconSize: iconSize,
                                );
                              } else {
                                return IconButton(
                                  onPressed: () async {
                                    deleteVisualSummary(
                                        widget.visualSummary.title,
                                        widget.visualSummary.mimeTypeVisualSummary,
                                        widget.visualSummary.mimeTypeVisualSummaryThumbnail);
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: iconSize,
                                );
                              }
                            }),
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
                        const SizedBox(width: 10),
                        if (widget.visualSummary.linkTwitter != null)
                          IconButton(
                            //Button to jump to twitter for discussion
                            onPressed: () async {
                              final url = widget.visualSummary.linkTwitter.toString();
                              final uri = Uri.parse(url);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                throw "Could not launch $url";
                              }
                            },
                            icon: const Icon(FontAwesomeIcons.twitter, color: Colors.blue),
                            iconSize: iconSize,
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    detailField("Year Guideline Published", "${widget.visualSummary.yearGuidelinePublished}"),
                    detailField("Society", widget.visualSummary.giSocietyJournal.join(", ")),
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
