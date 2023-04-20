import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/isar_service.dart';
import '../../models/podcast.dart';
import '../global_navigation_state.dart';
import 'podcast_card.dart';
import 'package:emoroid_digest_app/utils/firebase.dart';

const showAll = "Show all";
const clearAll = "Clear all";

class PodcastListPage extends StatefulWidget {
  const PodcastListPage({super.key});

  @override
  State<PodcastListPage> createState() => _PodcastListPageState();
}

class _PodcastListPageState extends State<PodcastListPage> {
  final double filterTitleFontSize = 20;
  final IconData filterDropDownIcon = Icons.arrow_drop_down_circle_outlined;
  bool isLoading = false;
  bool? selectListened;
  bool? selectFavorite;
  Podcast? podcastSelected;
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
        await syncPodcastsFromFirestore();
      }
      setState(() {
        selectedKeywords = IsarService().getUniquePodcastsKeywords();
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<List<Podcast>> _getFilteredPodcasts() async {
    List<Podcast> sourceList;
    List<Podcast> toRender = [];

    sourceList = await IsarService().getPodcasts();

    for (var p in sourceList) {
      if (selectedOrganSystem != null && !p.organSystems.contains(selectedOrganSystem)) {
        continue;
      }
      if (selectedGISocietyJournal != null && p.giSocietyJournal != selectedGISocietyJournal) {
        continue;
      }
      if (selectedYearGuidelinePublished != null &&
          p.yearGuidelinePublished != int.parse(selectedYearGuidelinePublished!)) {
        continue;
      }
      if (selectedKeywords.intersection(p.keywords.toSet()).isEmpty) {
        continue;
      }
      if (selectListened != null && p.hasListened != selectListened) {
        continue;
      }
      if (selectFavorite != null && p.isFavorite != selectFavorite) {
        continue;
      }
      toRender.add(p);
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
          await syncPodcastsFromFirestore();
        }
        setState(() {});
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
                              final keywords = IsarService().getUniquePodcastsKeywords().toList();
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
                                                  selectedKeywords.addAll(IsarService().getUniquePodcastsKeywords());
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
                                      final societies = IsarService().getUniquePodcastsGISocietyJournal().toList();
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
                                          .getUniquePodcastsYearGuidelinePublished()
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
                                  getModalBottomSheetTitle("Listened"),
                                  Expanded(
                                    child: StatefulBuilder(builder: (context, setListState) {
                                      return ListView(
                                        children: [
                                          RadioListTile(
                                            value: null,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectListened = val;
                                                  }));
                                            },
                                            title: const Text(showAll),
                                            groupValue: selectListened,
                                          ),
                                          RadioListTile(
                                            value: true,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectListened = val;
                                                  }));
                                            },
                                            title: const Text("Listened"),
                                            groupValue: selectListened,
                                          ),
                                          RadioListTile(
                                            value: false,
                                            onChanged: (val) {
                                              setState(() => setListState(() {
                                                    selectListened = val;
                                                  }));
                                            },
                                            title: const Text("Not yet listen"),
                                            groupValue: selectListened,
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ))),
                    child: getFilterOutlinedButtonChild("Listened"),
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
              child: FutureBuilder<List<Podcast>>(
                  future: _getFilteredPodcasts(),
                  builder: (BuildContext context, AsyncSnapshot<List<Podcast>> future) {
                    if (isLoading || !future.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (future.data!.isEmpty) {
                        if (connectivityStatus != ConnectivityResult.none) {
                          return SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("No podcasts available",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Please update the filters",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("No podcasts available",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("No internet connection",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                          );
                        }
                      }
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        cacheExtent: 999,
                        itemCount: future.data!.length,
                        itemBuilder: (context, index) => PodcastCard(
                          podcast: future.data![index],
                          onTap: (context) {
                            () async {
                              await Navigator.of(context).pushNamed(
                                "/podcast/detail",
                                arguments: PodcastDetailPageArguments(future.data![index].id!),
                              );
                              // ignore: use_build_context_synchronously
                              Provider.of<GlobalNavigationState>(context, listen: false).updateBasedOnRoute();
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
