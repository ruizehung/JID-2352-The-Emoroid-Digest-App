import 'package:audio_service/audio_service.dart';
import 'package:emoroid_digest_app/models/podcast.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:emoroid_digest_app/utils/local_file.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../models/visual_summary.dart';
import '../../services/services_locator.dart';
import '../../utils/isar_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'page_manager.dart';

class PodcastDetailPageArguments {
  final String podcastID;

  PodcastDetailPageArguments(this.podcastID);
}

class PodcastDetailPage extends StatefulWidget {
  const PodcastDetailPage({super.key});

  @override
  State<PodcastDetailPage> createState() => _PodcastDetailPageState();
}

class _PodcastDetailPageState extends State<PodcastDetailPage> with LocalFileSystem {
  final double iconSize = 30;
  final double fieldFontSize = 16;
  PageManager? _pageManager;
  late AudioHandler _audioHandler;
  late PodcastDetailPageArguments args;
  late Podcast? podcastArgs = IsarService().getPodcast(args.podcastID);
  Duration newDuration = Duration.zero;

  @override
  void didChangeDependencies() async {
    args = ModalRoute.of(context)!.settings.arguments as PodcastDetailPageArguments;
    _audioHandler = getIt<AudioHandler>();
    _audioHandler.mediaItem.listen((mediaItem) {
      if (mediaItem?.id == podcastArgs?.id) {
        _pageManager = PageManager(null, null);
        setState(() {});
      }
    });
    setState(() {
      if (podcastArgs?.currentDuration != null) {
        newDuration = Duration(microseconds: (podcastArgs!.currentDuration! * 1000).toInt());
      }
    });
    super.didChangeDependencies();
  }

  void setNewAudio() {
    _pageManager = PageManager(podcastArgs, newDuration);
    setState(() {});
    _pageManager!.play();
  }

  void setNewSeek(Duration newPosition) {
    setState(() {
      newDuration = newPosition;
    });
  }

  void setCurrentDuration() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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

  Widget visualSummaryDetailField(String fieldTitle, String podcastTitile, BuildContext context) {
    List<VisualSummary> visualSummaries = IsarService().getVisualSummaryWithPodcastTitle(podcastTitile);
    List<Widget> columnChildren = [
      detailFieldTitle(fieldTitle),
      const SizedBox(
        height: 8,
      )
    ];

    if (visualSummaries.isEmpty) {
      columnChildren.add(
        Row(
          children: [
            Expanded(
              child: Text(
                "N/A",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: fieldFontSize,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      for (var vs in visualSummaries) {
        columnChildren.add(
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: vs.title,
                      style: TextStyle(
                        fontSize: fieldFontSize,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed(
                            "/visual-summary/detail",
                            arguments: VisualSummaryDetailPageArguments(vs.id!),
                          );
                        }),
                ),
              ),
            ],
          ),
        );
      }
    }

    columnChildren.add(const Divider());

    return Column(children: columnChildren);
  }

  @override
  Widget build(BuildContext context) {
    final podcast = IsarService().getPodcast(args.podcastID);
    return podcast == null
        ? Center(child: Text("Unknown podcast ID: ${args.podcastID}"))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          "/podcast",
                        );
                      },
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      iconSize: 36,
                    )
                  ]),
                  Text(
                    podcast.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  if (_pageManager != null)
                    ValueListenableBuilder<ProgressBarState>(
                      valueListenable: _pageManager!.progressNotifier,
                      builder: (_, value, __) {
                        return ProgressBar(
                          progress: value.current,
                          buffered: value.buffered,
                          total: value.total,
                          onSeek: _pageManager!.seek,
                        );
                      },
                    ),
                  if (_pageManager != null)
                    ValueListenableBuilder<ButtonState>(
                      valueListenable: _pageManager!.buttonNotifier,
                      builder: (_, value, __) {
                        switch (value) {
                          case ButtonState.loading:
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              width: 32.0,
                              height: 32.0,
                              child: const CircularProgressIndicator(),
                            );
                          case ButtonState.paused:
                            return IconButton(
                              icon: const Icon(Icons.play_arrow),
                              iconSize: 32.0,
                              onPressed: _pageManager!.play,
                            );
                          case ButtonState.playing:
                            return IconButton(
                              icon: const Icon(Icons.pause),
                              iconSize: 32.0,
                              onPressed: _pageManager!.pause,
                            );
                        }
                      },
                    ),
                  if (_pageManager == null)
                    ProgressBar(
                      progress: newDuration,
                      buffered: Duration.zero,
                      total: podcast.totalDuration != null
                          ? Duration(microseconds: (podcast.totalDuration! * 1000).toInt())
                          : Duration.zero,
                      onSeek: setNewSeek,
                    ),
                  if (_pageManager == null)
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 32.0,
                      onPressed: setNewAudio,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  podcast.hasListened = !podcast.hasListened;
                                });
                                IsarService().savePodcast(podcast);
                              },
                              icon: Icon(
                                CupertinoIcons.ear,
                                color: podcast.hasListened ? Colors.green : Colors.black,
                                size: iconSize,
                                semanticLabel: 'An eye icon to indicate if a user has read a visual summary',
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  podcast.isFavorite = !podcast.isFavorite;
                                });
                                IsarService().savePodcast(podcast);
                              },
                              icon: Icon(
                                podcast.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                color: podcast.isFavorite ? Colors.pink : Colors.black,
                                size: iconSize,
                                semanticLabel:
                                    'A heart icon to indicate if a user has marked a visual summary as favorite',
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share_outlined),
                              iconSize: iconSize,
                            ),
                            const SizedBox(width: 10),
                            if (podcast.twitterPodcastLink != null)
                              IconButton(
                                //Button to jump to twitter for discussion
                                onPressed: () async {
                                  final url = podcast.twitterPodcastLink.toString();
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw "Could not launch $url";
                                  }
                                },
                                icon: const Icon(FontAwesomeIcons.twitter, color: Colors.blue),
                                iconSize: iconSize,
                              ),
                            if (podcast.linkGuest != null)
                              IconButton(
                                //Button to jump to twitter for discussion
                                onPressed: () async {
                                  final url = podcast.linkGuest.toString();
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw "Could not launch $url";
                                  }
                                },
                                icon: const Icon(Icons.person),
                                iconSize: iconSize,
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        detailField("Guest", podcast.guest),
                        detailField("Year Guideline Published", "${podcast.yearGuidelinePublished}"),
                        detailField("Society", podcast.giSocietyJournal.join(", ")),
                        detailField("Organ Systems", podcast.organSystems.join(", ")),
                        detailField("Keywords", podcast.keywords.join(", ")),
                        detailField("Guideline Authors (First two and last listed author)",
                            podcast.guidelineAuthors.join(", ")),
                        visualSummaryDetailField("Visual Summary", podcast.title, context),
                        detailField("Podcast Release Date",
                            "${podcast.dateReleased.year.toString()}-${podcast.dateReleased.month.toString().padLeft(2, '0')}-${podcast.dateReleased.day.toString().padLeft(2, '0')}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
