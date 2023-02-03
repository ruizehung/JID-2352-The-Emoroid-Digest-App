import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoroid_digest_app/models/last_update.dart';
import 'package:flutter/material.dart';
import '../isar_service.dart';
import '../models/visual_summary.dart';
import 'visual_summary_card.dart';
import 'package:emoroid_digest_app/firebase.dart';
import 'visual_summary_detail_page.dart';

class VisualSummaryPage extends StatefulWidget {
  const VisualSummaryPage({super.key});

  @override
  State<VisualSummaryPage> createState() => _VisualSummaryPageState();
}

class _VisualSummaryPageState extends State<VisualSummaryPage> {
  final double filterTitleFontSize = 20;

  VisualSummary? visualSummarySelected;
  final selectedOrganSystems = <String, bool>{};
  final selectedGISocietyJournal = <String, bool>{};
  final selectedKeywords = <String, bool>{};
  final selectedYearGuidelinePublished = <int, bool>{};

  @override
  void initState() {
    super.initState();
    for (var organSystem in IsarService().getUniqueOrganSystems()) {
      selectedOrganSystems.addAll({organSystem: true});
    }
    for (var giSocietyJournal in IsarService().getUniqueGISocietyJournal()) {
      selectedGISocietyJournal.addAll({giSocietyJournal: true});
    }
    for (var keyword in IsarService().getUniqueKeywords()) {
      selectedKeywords.addAll({keyword: true});
    }
    for (var year in IsarService().getUniqueYearGuidelinePublished()) {
      selectedYearGuidelinePublished.addAll({year: true});
    }
  }

  Future<List<VisualSummary>> _getUpdateVisualSummaries() async {
    final lastUpdateCloud = await FirebaseFirestore.instance.collection('Update').doc("lastUpdate").get();
    final visualSummariesLastUpdateTime = (lastUpdateCloud.data()!["visualSummaries"] as Timestamp).toDate();
    var lastUpdateLocal = await IsarService().getLastUpdate();
    if (lastUpdateLocal!.visualSummaries == null ||
        lastUpdateLocal.visualSummaries!.compareTo(visualSummariesLastUpdateTime) < 0) {
      await syncVisualSummariesFromFirestore();
      lastUpdateLocal.visualSummaries = visualSummariesLastUpdateTime;
      IsarService().saveLastUpdate(lastUpdateLocal);
    }

    // filter

    return IsarService().getAllVisualSummariesWithThumbnail();
  }

  void setVisualSummarySelected(VisualSummary? v) {
    setState(() {
      visualSummarySelected = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (visualSummarySelected != null) {
      debugPrint("visualSummarySelected: ${visualSummarySelected!.title}");
    }

    // todo: add pull to refresh
    // https://stackoverflow.com/questions/65682460/how-to-use-refreshindicator-to-update-futurebuilder-state
    return Expanded(
        child: visualSummarySelected != null
            ? VisualSummaryDetailPage(
                visualSummary: visualSummarySelected!,
                setVisualSummarySelected: setVisualSummarySelected,
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.blue)))),
                              onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: ((context) => FractionallySizedBox(
                                        heightFactor: 1,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Text(
                                                "Organ Systems",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: filterTitleFontSize,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: StatefulBuilder(
                                                  builder: (context, setListState) => ListView.builder(
                                                        scrollDirection: Axis.vertical,
                                                        itemCount: selectedOrganSystems.length,
                                                        itemBuilder: (context, index) => CheckboxListTile(
                                                          value: selectedOrganSystems[
                                                              selectedOrganSystems.keys.elementAt(index)],
                                                          onChanged: (val) {
                                                            setListState(() {
                                                              selectedOrganSystems.addAll(
                                                                  {selectedOrganSystems.keys.elementAt(index): val!});
                                                            });
                                                          },
                                                          activeColor: Colors.blue,
                                                          title: Text(selectedOrganSystems.keys.elementAt(index)),
                                                        ),
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ))),
                              child: Row(
                                children: const [
                                  Text("Organ Systems"),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(Icons.arrow_drop_down_circle_outlined),
                                ],
                              )),
                          OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.blue)))),
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Text("GI Society"),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(Icons.arrow_drop_down_circle_outlined),
                                ],
                              )),
                          OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.blue)))),
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Text("Year Guideline Published"),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(Icons.arrow_drop_down_circle_outlined),
                                ],
                              )),
                          OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.blue)))),
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Text("Keywords"),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(Icons.arrow_drop_down_circle_outlined),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: FutureBuilder<List<VisualSummary>>(
                          future: _getUpdateVisualSummaries(),
                          builder: (BuildContext context, AsyncSnapshot<List<VisualSummary>> future) {
                            if (!future.hasData) {
                              return const Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                cacheExtent: 999,
                                itemCount: future.data!.length,
                                itemBuilder: (context, index) => VisualSummaryCard(
                                  visualSummary: future.data![index],
                                  setVisualSummarySelected: setVisualSummarySelected,
                                ),
                              );
                            }
                          })),
                ],
              ));
  }
}
