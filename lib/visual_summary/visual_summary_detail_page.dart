import 'package:dio/dio.dart';
import 'package:emoroid_digest_app/utils/local_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:io';

import '../models/visual_summary.dart';
import '../utils/isar_service.dart';

class VisualSummaryDetailPage extends StatefulWidget {
  const VisualSummaryDetailPage({super.key, required this.visualSummary, required this.setVisualSummarySelected});

  final VisualSummary visualSummary;
  final Function(VisualSummary? v) setVisualSummarySelected;

  @override
  State<VisualSummaryDetailPage> createState() => _VisualSummaryDetailPageState();
}

class _VisualSummaryDetailPageState extends State<VisualSummaryDetailPage> with LocalFileSystem {
  final double iconSize = 30;
  final double fieldFontSize = 16;
  var _isDownloading = false;

  Future<void> downloadVisualSummary() async {
    setState(() {
      _isDownloading = true;
    });
    try {
      await Dio().download(widget.visualSummary.linkVisualSummaryThumbnailSource!,
          getFilePath(widget.visualSummary.linkVisualSummaryThumbnailStorage!));
      await Dio().download(
          widget.visualSummary.linkVisualSummarySource!, getFilePath(widget.visualSummary.linkVisualSummaryStorage!));
      setState(() {
        widget.visualSummary.isDownloaded = true;
      });
      IsarService().saveVisualSummary(widget.visualSummary);
      print("Successfully downloaded visual summary ${widget.visualSummary.title}.");
    } catch (e) {
      print("Error downloading visual summary.\n\n" + e.toString());
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  Future<void> deleteVisualSummary() async {
    setState(() {
      widget.visualSummary.isDownloaded = false;
    });
    IsarService().saveVisualSummary(widget.visualSummary);
    List<File> filesToDelete = [];
    filesToDelete.add(File(getFilePath(widget.visualSummary.linkVisualSummaryStorage!)));
    filesToDelete.add(File(getFilePath(widget.visualSummary.linkVisualSummaryThumbnailStorage!)));
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
    final localVisualSummary = File(getFilePath(widget.visualSummary.linkVisualSummaryStorage!));
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
                future: localVisualSummary.exists(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (widget.visualSummary.mimeTypeVisualSummary == "application/pdf") {
                    if (snapshot.data! == false) {
                      return SizedBox(
                          height: 240, child: SfPdfViewer.network(widget.visualSummary.linkVisualSummarySource!));
                    } else {
                      return SizedBox(height: 240, child: SfPdfViewer.file(localVisualSummary));
                    }
                  } else {
                    if (snapshot.data! == false) {
                      return Image.network(widget.visualSummary.linkVisualSummarySource!);
                    } else {
                      return Image.file(localVisualSummary);
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
                              if (widget.visualSummary.hasRead) {
                                widget.visualSummary.hasRead = false;
                              } else {
                                widget.visualSummary.hasRead = true;
                              }
                            });
                            IsarService().saveVisualSummary(widget.visualSummary);
                          },
                          icon: Icon(
                            CupertinoIcons.eye,
                            color: widget.visualSummary.hasRead ? Colors.green : Colors.black,
                            size: iconSize,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.visualSummary.isFavorite = !widget.visualSummary.isFavorite;
                            });
                            IsarService().saveVisualSummary(widget.visualSummary);
                          },
                          icon: Icon(
                            widget.visualSummary.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                            color: widget.visualSummary.isFavorite ? Colors.pink : Colors.black,
                            size: iconSize,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                        ),
                        SizedBox(width: _isDownloading ? 21.5 : 10),
                        if (_isDownloading == true)
                          const SizedBox(
                            height: 25.0,
                            width: 25.0,
                            child: CircularProgressIndicator(),
                          ),
                        if (widget.visualSummary.isDownloaded == false && _isDownloading == false)
                          IconButton(
                            onPressed: () async {
                              await downloadVisualSummary();
                            },
                            icon: const Icon(Icons.file_download_outlined),
                            iconSize: iconSize,
                          ),
                        if (widget.visualSummary.isDownloaded == true && _isDownloading == false)
                          IconButton(
                            onPressed: () async {
                              await deleteVisualSummary();
                            },
                            icon: const Icon(Icons.delete),
                            iconSize: iconSize,
                          ),
                        SizedBox(width: _isDownloading ? 21.5 : 10),
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
                    detailField("Visual Summary Fellow Author", widget.visualSummary.fellowAuthor),
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
