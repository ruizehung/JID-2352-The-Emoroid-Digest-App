import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:flutter/material.dart';
import '../../utils/isar_service.dart';
import '../../models/visual_summary.dart';
import 'visual_summary_card.dart';
import 'package:emoroid_digest_app/utils/firebase.dart';

const showAll = "Show all";
const clearAll = "Clear all";

class VisualSummaryListPage extends StatefulWidget {
  const VisualSummaryListPage({super.key});

  @override
  State<VisualSummaryListPage> createState() => _VisualSummaryListPageState();
}

class _VisualSummaryListPageState extends State<VisualSummaryListPage> {
  final double filterTitleFontSize = 20;
  final IconData filterDropDownIcon = Icons.arrow_drop_down_circle_outlined;
  bool isLoading = false;
  bool? selectRead;
  bool? selectFavorite;
  VisualSummary? visualSummarySelected;
  String? selectedOrganSystem;
  String? selectedGISocietyJournal;
  String? selectedYearGuidelinePublished;
  Set<String> selectedKeywords = {};
  late StreamSubscription<ConnectivityResult> subscription;
  ConnectivityResult connectivityStatus = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        isLoading = true;
      });
      final connectivity = await (Connectivity().checkConnectivity());
      setState(() {
        connectivityStatus = connectivity;
      });
      subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        setState(() {
          connectivityStatus = result;
        });
      });
      
      if (connectivityStatus != ConnectivityResult.none) {
        await syncVisualSummariesFromFirestore();
      }
      
      setState(() {
        selectedKeywords = IsarService().getUniqueVisualSummariesKeywords();
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<List<VisualSummary>> _getFilteredVisualSummaries() async {
    List<VisualSummary> sourceList;
    List<VisualSummary> toRender = [];
    if (connectivityStatus == ConnectivityResult.none) {
      sourceList = await IsarService().getDownloadedVisualSummaries();
    } else {
      sourceList = await IsarService().getVisualSummariesWithThumbnail();
    }

    for (var vs in sourceList) {
      if (selectedOrganSystem != null && !vs.organSystems.contains(selectedOrganSystem)) {
        continue;
      }
      if (selectedGISocietyJournal != null && !vs.giSocietyJournal.contains(selectedGISocietyJournal)) {
        continue;
      }
      if (selectedYearGuidelinePublished != null &&
          vs.yearGuidelinePublished != int.parse(selectedYearGuidelinePublished!)) {
        continue;
      }
      if (selectedKeywords.intersection(vs.keywords.toSet()).isEmpty) {
        continue;
      }
      if (selectRead != null && vs.hasRead != selectRead) {
        continue;
      }
      if (selectFavorite != null && vs.isFavorite != selectFavorite) {
        continue;
      }
      toRender.add(vs);
    }
    toRender.sort((a, b) => -a.dateReleased.compareTo(b.dateReleased));
    return toRender;
  }

  Widget getFilterOutlinedButtonChild(String text) {
    return Row(
      children: [
        Text(text),
        const SizedBox(
          width: 6,
        ),
        Icon(filterDropDownIcon),
      ],
    );
  }

  Widget getModalBottomSheetTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: filterTitleFontSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult != ConnectivityResult.none) {
          await syncVisualSummariesFromFirestore();
        }
        setState(() {
          connectivityStatus = connectivityResult;
        });
        await Future.delayed(const Duration(seconds: 1));
      },
      child: Column(
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
                            borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.blue)))),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: ((context) => FractionallySizedBox(
                              heightFactor: 1,
                              child: Column(
                                children: [
                                  getModalBottomSheetTitle("Organ Systems"),
                                  Expanded(
                                    child: StatefulBuilder(builder: (context, setListState) {
                                      final organSystems = IsarService().getUniqueOrganSystems().toList();
                                      organSystems.sort();
                                      organSystems.insert(0, showAll);
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: organSystems.length,
                                        itemBuilder: (context, index) => RadioListTile(
                                          value: organSystems[index],
                                          onChanged: (val) {
                                            setState(() => setListState(() {
                                                  selectedOrganSystem = val != showAll ? val : null;
                                                }));
                                          },
                                          activeColor: Colors.blue,
                                          title: Text(organSystems[index]),
                                          groupValue: selectedOrganSystem ?? showAll,
                                          controlAffinity: ListTileControlAffinity.trailing,
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ))),
                    child: getFilterOutlinedButtonChild("Organ Systems"),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.blue)))),
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: ((context) => FractionallySizedBox(
                            heightFactor: 1,
                            child: StatefulBuilder(builder: (context, setListState) {
                              final keywords = IsarService().getUniqueVisualSummariesKeywords().toList();
                              keywords.sort(((a, b) => a.toLowerCase().compareTo(b.toLowerCase())));
                              return Column(
                                children: [
                                  getModalBottomSheetTitle("Keywords"),
                                  SingleChildScrollView(
                                    child: Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            setState(() => setListState(() {
                                                  selectedKeywords
                                                      .addAll(IsarService().getUniqueVisualSummariesKeywords());
                                                }));
                                          },
                                          child: const Text(showAll),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          setState(() => setListState(() {
                                                selectedKeywords.clear();
                                              }));
                                        },
                                        child: const Text(clearAll),
                                      ),
                                    ]),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: keywords.length,
                                      itemBuilder: (context, index) => CheckboxListTile(
                                        value: selectedKeywords.contains(keywords[index]),
                                        onChanged: (val) {
                                          setState(() => setListState(() {
                                                if (val!) {
                                                  selectedKeywords.add(keywords[index]);
                                                } else {
                                                  selectedKeywords.remove(keywords[index]);
                                                }
                                              }));
                                        },
                                        activeColor: Colors.blue,
                                        title: Text(keywords[index]),
                                        controlAffinity: ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          )),
                    ),
                    child: getFilterOutlinedButtonChild("Keywords"),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.blue)))),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: ((context) => FractionallySizedBox(
                              heightFactor: 1,
                              child: Column(
                                children: [
                                  getModalBottomSheetTitle("GI Society"),
                                  Expanded(
                                    child: StatefulBuilder(builder: (context, setListState) {
                                      final societies =
                                          IsarService().getUniqueVisualSummariesGISocietyJournal().toList();
                                      societies.sort();
                                      societies.insert(0, showAll);
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: societies.length,
                                        itemBuilder: (context, index) => RadioListTile(
                                          value: societies[index],
                                          onChanged: (val) {
                                            setState(() => setListState(() {
                                                  selectedGISocietyJournal = val != showAll ? val : null;
                                                }));
                                          },
                                          activeColor: Colors.blue,
                                          title: Text(societies[index]),
                                          groupValue: selectedGISocietyJournal ?? showAll,
                                          controlAffinity: ListTileControlAffinity.trailing,
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ))),
                    child: getFilterOutlinedButtonChild("GI Society"),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.blue)))),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: ((context) => FractionallySizedBox(
                              heightFactor: 1,
                              child: Column(
                                children: [
                                  getModalBottomSheetTitle("Year Guideline Published"),
                                  Expanded(
                                    child: StatefulBuilder(builder: (context, setListState) {
                                      final societies = IsarService()
                                          .getUniqueVisualSummariesYearGuidelinePublished()
                                          .map((e) => e.toString())
                                          .toList();
                                      societies.sort((a, b) => b.compareTo(a));
                                      societies.insert(0, showAll);
                                      return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: societies.length,
                                        itemBuilder: (context, index) => RadioListTile(
                                          value: societies[index],
                                          onChanged: (val) {
                                            setState(() => setListState(() {
                                                  selectedYearGuidelinePublished = val != showAll ? val : null;
                                                }));
                                          },
                                          activeColor: Colors.blue,
                                          title: Text(societies[index]),
                                          groupValue: selectedYearGuidelinePublished ?? showAll,
                                          controlAffinity: ListTileControlAffinity.trailing,
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ))),
                    child: getFilterOutlinedButtonChild("Year Guideline Published"),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.blue)))),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: ((context) => FractionallySizedBox(
                              heightFactor: 1,
                              child: Column(
                                children: [
                                  getModalBottomSheetTitle("Read"),
                                  Expanded(
                                    child: StatefulBuilder(builder: (context, setListState) {
                                      return ListView(
                                        children: [
                                          RadioListTile(
                                            value: null,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectRead = val;
                                                  }));
                                            },
                                            title: const Text(showAll),
                                            groupValue: selectRead,
                                          ),
                                          RadioListTile(
                                            value: true,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectRead = val;
                                                  }));
                                            },
                                            title: const Text("Read"),
                                            groupValue: selectRead,
                                          ),
                                          RadioListTile(
                                            value: false,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectRead = val;
                                                  }));
                                            },
                                            title: const Text("Not yet read"),
                                            groupValue: selectRead,
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ))),
                    child: getFilterOutlinedButtonChild("Read"),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.blue)))),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: ((context) => FractionallySizedBox(
                              heightFactor: 1,
                              child: Column(
                                children: [
                                  getModalBottomSheetTitle("Favorite"),
                                  Expanded(
                                    child: StatefulBuilder(builder: (context, setListState) {
                                      return ListView(
                                        children: [
                                          RadioListTile(
                                            value: null,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectFavorite = val;
                                                  }));
                                            },
                                            title: const Text(showAll),
                                            groupValue: selectFavorite,
                                          ),
                                          RadioListTile(
                                            value: true,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectFavorite = val;
                                                  }));
                                            },
                                            title: const Text("Favorite"),
                                            groupValue: selectFavorite,
                                          ),
                                          RadioListTile(
                                            value: false,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectFavorite = val;
                                                  }));
                                            },
                                            title: const Text("Non-favorite"),
                                            groupValue: selectFavorite,
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ))),
                    child: getFilterOutlinedButtonChild("Favorite"),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              fit: FlexFit.loose,
              child: FutureBuilder<List<VisualSummary>>(
                  future: _getFilteredVisualSummaries(),
                  builder: (BuildContext context, AsyncSnapshot<List<VisualSummary>> future) {
                    if (isLoading || !future.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (future.data!.isEmpty) {
                        String errorText;
                        if (connectivityStatus == ConnectivityResult.none) {
                          errorText =
                              "No internet connection! Please download some visual summaries to have them available offline!\nOr, update your filters!";
                        } else {
                          errorText = "Please update your filters!";
                        }

                        return SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("No visual summaries available",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(errorText,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        cacheExtent: 999,
                        itemCount: future.data!.length,
                        itemBuilder: (context, index) => VisualSummaryCard(
                          visualSummary: future.data![index],
                          onTap: (context) {
                            () async {
                              // ignore: use_build_context_synchronously
                              await Navigator.of(context).pushNamed(
                                "/visual-summary/detail",
                                arguments: VisualSummaryDetailPageArguments(future.data![index].id!),
                              );
                              setState(() {});
                            }();
                          },
                        ),
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
