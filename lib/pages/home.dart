import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_card.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_card.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/firebase.dart';
import '../utils/isar_service.dart';
import '../models/podcast.dart';
import '../models/visual_summary.dart';
import 'global_navigation_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  VisualSummary? visualSummarySelected;
  Podcast? podcastSelected;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return;
      }
      setState(() {
        isLoading = true;
      });
      await syncVisualSummariesFromFirestore();
      await syncPodcastsFromFirestore();
      setState(() {
        isLoading = false;
      });
    });
  }

  void setVisualSummarySelected(VisualSummary? v) {
    setState(() {
      visualSummarySelected = v;
    });
  }

  void setPodcastSelected(Podcast? p) {
    setState(() {
      podcastSelected = p;
    });
  }

  Future<VisualSummary> _getLatestVisualSummary() async {
    List<VisualSummary> list = await IsarService().getVisualSummariesWithThumbnail();
    VisualSummary vs = list[0];
    for (int i = 1; i < list.length; i++) {
      if (list[i].dateReleased.compareTo(vs.dateReleased) > 0) {
        vs = list[i];
      }
    }
    return vs;
  }

  Future<Podcast> _getLatestPodcast() async {
    List<Podcast> list = await IsarService().getPodcasts();
    Podcast p = list[0];
    for (int i = 1; i < list.length; i++) {
      if (list[i].dateReleased.compareTo(p.dateReleased) > 0) {
        p = list[i];
      }
    }
    return p;
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarState = Provider.of<GlobalNavigationState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 20),
          child: Text(
            'Latest Visual Summary',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        FutureBuilder<VisualSummary>(
            future: _getLatestVisualSummary(),
            builder: (BuildContext context, AsyncSnapshot<VisualSummary> future) {
              if (isLoading || !future.hasData) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: CircularProgressIndicator(),
                ));
              } else {
                return VisualSummaryCard(
                  visualSummary: future.data!,
                  onTap: (context) {
                    () async {
                      bottomNavBarState.page = 0;
                      // ignore: use_build_context_synchronously
                      await Navigator.of(context).pushNamed(
                        "/visual-summary/detail",
                        arguments: VisualSummaryDetailPageArguments(future.data!.id!),
                      );
                      bottomNavBarState.updateBasedOnRoute();
                      setState(() {});
                    }();
                  },
                );
              }
            }),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 20),
          child: Text(
            'Latest Podcast',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        FutureBuilder<Podcast>(
            future: _getLatestPodcast(),
            builder: (BuildContext context, AsyncSnapshot<Podcast> future) {
              if (isLoading || !future.hasData) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: CircularProgressIndicator(),
                ));
              } else {
                return PodcastCard(
                  podcast: future.data!,
                  onTap: (context) {
                    () async {
                      bottomNavBarState.page = 2;
                      await Navigator.of(context).pushNamed(
                        "/podcast/detail",
                        arguments: PodcastDetailPageArguments(future.data!.id!),
                      );
                      bottomNavBarState.updateBasedOnRoute();
                      setState(() {});
                    }();
                  },
                );
              }
            }),
      ],
    );
  }
}
