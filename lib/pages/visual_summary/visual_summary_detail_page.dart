import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:emoroid_digest_app/utils/local_file.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:io';

import '../../models/visual_summary.dart';
import '../../utils/isar_service.dart';
import '../bottom_nav_bar_state.dart';
import '../podcast/podcast_detail_page.dart';

class VisualSummaryDetailPageArguments {
  final String visualSummaryID;

  VisualSummaryDetailPageArguments(this.visualSummaryID);
}

class VisualSummaryDetailPage extends StatefulWidget {
  const VisualSummaryDetailPage({super.key});

  @override
  State<VisualSummaryDetailPage> createState() => _VisualSummaryDetailPageState();
}

class _VisualSummaryDetailPageState extends State<VisualSummaryDetailPage> with LocalFileSystem {
  final double iconSize = 30;
  final double fieldFontSize = 16;
  var _isLoading = false;

  Future<void> downloadVisualSummary(VisualSummary visualSummary) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Dio()
          .download(visualSummary.linkVisualSummarySource!, getFilePath(visualSummary.linkVisualSummaryStorage!));
      setState(() {
        visualSummary.isDownloaded = true;
      });
      IsarService().saveVisualSummary(visualSummary);
      print("Successfully downloaded visual summary ${visualSummary.title}.");
    } catch (e) {
      print("Error downloading visual summary.\n\n" + e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> deleteVisualSummary(VisualSummary visualSummary) async {
    setState(() {
      visualSummary.isDownloaded = false;
    });
    IsarService().saveVisualSummary(visualSummary);
    List<File> filesToDelete = [];
    filesToDelete.add(File(getFilePath(visualSummary.linkVisualSummaryStorage!)));
    //Keep loop here in case we want to delete multiple things in the future when we delete a summary
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

  Widget detailFieldTitle(String title) {
    return Row(
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
    );
  }

  Widget detailField(String title, String value) {
    return Column(
      children: [
        detailFieldTitle(title),
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

  Widget podcastDetailField(String fieldTitle, String? podcastTitile, BuildContext context) {
    String podcastID = "N/A";
    if (podcastTitile != null) {
      podcastID = IsarService().getPodcastByTitle(podcastTitile)!.id!;
    }
    return Column(
      children: [
        detailFieldTitle(fieldTitle),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: podcastTitile ?? "N/A",
                  style: TextStyle(
                    fontSize: fieldFontSize,
                    color: podcastTitile != null ? Colors.blue : Colors.black,
                    decoration: podcastTitile != null ? TextDecoration.underline : null,
                  ),
                  recognizer: podcastTitile != null
                      ? (TapGestureRecognizer()
                        ..onTap = () async {
                          Provider.of<BottomNavBarState>(context, listen: false).page = 2;
                          await Navigator.of(context).pushNamed(
                            "/podcast/detail",
                            arguments: PodcastDetailPageArguments(podcastID),
                          );
                          // ignore: use_build_context_synchronously
                          Provider.of<BottomNavBarState>(context, listen: false).updateBasedOnRoute();
                        })
                      : null,
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
    File? localVisualSummary;
    final args = ModalRoute.of(context)!.settings.arguments as VisualSummaryDetailPageArguments;
    final visualSummary = IsarService().getVisualSummary(args.visualSummaryID);
    if (visualSummary != null) {
      localVisualSummary = File(getFilePath(visualSummary.linkVisualSummaryStorage!));
    }

    return visualSummary == null
        ? Center(child: Text("Unknown visual summary ID: ${args.visualSummaryID}"))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      iconSize: 36,
                    )
                  ]),
                  Text(
                    visualSummary.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  FutureBuilder(
                      future: localVisualSummary!.exists(),
                      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (snapshot.data == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (visualSummary.mimeTypeVisualSummary == "application/pdf") {
                          if (snapshot.data! == false) {
                            return SizedBox(
                              height: 240,
                              child: SfPdfViewer.network(
                                visualSummary.linkVisualSummarySource!,
                                onDocumentLoadFailed: (details) async {
                                  if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text("No internet connection. Failed to load PDF.")));
                                    }
                                  } else {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text(details.description)));
                                    }
                                  }
                                },
                              ),
                            );
                          } else {
                            return SizedBox(height: 240, child: SfPdfViewer.file(localVisualSummary!));
                          }
                        } else {
                          if (snapshot.data! == false) {
                            return Image.network(visualSummary.linkVisualSummarySource!);
                          } else {
                            return Image.file(localVisualSummary!);
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
                                  visualSummary.hasRead = !visualSummary.hasRead;
                                });
                                IsarService().saveVisualSummary(visualSummary);
                              },
                              icon: Icon(
                                CupertinoIcons.eye,
                                color: visualSummary.hasRead ? Colors.green : Colors.black,
                                size: iconSize,
                                semanticLabel: 'An eye icon to indicate if a user has read a visual summary',
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  visualSummary.isFavorite = !visualSummary.isFavorite;
                                });
                                IsarService().saveVisualSummary(visualSummary);
                              },
                              icon: Icon(
                                visualSummary.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                color: visualSummary.isFavorite ? Colors.pink : Colors.black,
                                size: iconSize,
                                semanticLabel:
                                    'A heart icon to indicate if a user has marked a visual summary as favorite',
                              ),
                            ),
                            SizedBox(width: _isLoading ? 21.5 : 10),
                            if (_isLoading == true)
                              const SizedBox(
                                height: 25.0,
                                width: 25.0,
                                child: CircularProgressIndicator(),
                              ),
                            if (visualSummary.isDownloaded == false && _isLoading == false)
                              IconButton(
                                onPressed: () async {
                                  await downloadVisualSummary(visualSummary);
                                },
                                icon: const Icon(Icons.file_download_outlined),
                                iconSize: iconSize,
                              ),
                            if (visualSummary.isDownloaded == true && _isLoading == false)
                              IconButton(
                                onPressed: () async {
                                  await deleteVisualSummary(visualSummary);
                                },
                                icon: const Icon(Icons.delete),
                                iconSize: iconSize,
                              ),
                            SizedBox(width: _isLoading ? 21.5 : 10),
                            IconButton(
                              onPressed: () async {
                                final uri = Uri.parse(visualSummary.linkOriginalManuscript);
                                if (await canLaunchUrl(uri)) {
                                  await FirebaseAnalytics.instance.logEvent(
                                    name: 'view_original_manuscript',
                                    parameters: {
                                      "view_original_manuscript_title": visualSummary.title.length <= 100 ? visualSummary.title : visualSummary.title.substring(0, 99),
                                    },
                                  );
                                  await launchUrl(uri);
                                } else {
                                  throw 'Could not launch ${visualSummary.linkOriginalManuscript}';
                                }
                              },
                              icon: const Icon(Icons.description_outlined),
                              iconSize: iconSize,
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                Share.share('check out my website https://example.com');
                              },
                              icon: const Icon(Icons.share_outlined),
                              iconSize: iconSize,
                            ),
                            const SizedBox(width: 10),
                            if (visualSummary.linkTwitter != null)
                              IconButton(
                                //Button to jump to twitter for discussion
                                onPressed: () async {
                                  final url = visualSummary.linkTwitter.toString();
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
                        detailField("Year Guideline Published", "${visualSummary.yearGuidelinePublished}"),
                        detailField("Society", visualSummary.giSocietyJournal.join(", ")),
                        detailField("Organ Systems", visualSummary.organSystems.join(", ")),
                        detailField("Keywords", visualSummary.keywords.join(", ")),
                        detailField("Guideline Authors (First two and last listed author)",
                            visualSummary.guidelineAuthors.join(", ")),
                        podcastDetailField("Recorded Podcast", visualSummary.recordedPodcastTitle, context),
                        detailField("Visual Summary Fellow Author", visualSummary.fellowAuthor),
                        detailField("Visual Summary Release Date",
                            "${visualSummary.dateReleased.year.toString()}-${visualSummary.dateReleased.month.toString().padLeft(2, '0')}-${visualSummary.dateReleased.day.toString().padLeft(2, '0')}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
