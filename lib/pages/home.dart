import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_card.dart';
import 'package:flutter/material.dart';

import '../utils/firebase.dart';
import '../utils/isar_service.dart';
import '../models/visual_summary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  VisualSummary? visualSummarySelected;

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

  @override
  Widget build(BuildContext context) {
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
                return VisualSummaryCard(visualSummary: future.data!);
              }
            }),
      ],
    );
  }
}
