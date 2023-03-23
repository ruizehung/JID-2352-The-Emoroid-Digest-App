import 'package:emoroid_digest_app/models/search_result_item.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_card.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_card.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchList = <String>{};
  final TextEditingController _searchController = TextEditingController();
  String searchBy = "title";

  Future<List<SearchResultItem>> result = IsarService().getSearchResultItems("title", "");
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 16, top: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12, bottom: 12),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Colors.blue,
                    size: 45,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 50,
                  child: TextField(
                      onChanged: (query) {
                        setState(() {
                          this.query = query;
                          result = IsarService().getSearchResultItems(searchBy, query);
                        });
                      },
                      controller: _searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "Search",
                          hintText: "search $searchBy",
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))))),
                ),
              ),
              Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.filter_list_rounded,
                    color: Colors.blue,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              child: const Text("Back"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                          title: const Text('Search by'),
                          content: Column(mainAxisSize: MainAxisSize.min, children: [
                            RadioListTile(
                              value: 'title',
                              onChanged: (String? val) {
                                setState(() {
                                  searchBy = val!;
                                });
                                Navigator.of(context).pop();
                              },
                              //activeColor: Colors.blue,
                              title: const Text("Title"),
                              groupValue: searchBy,
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                            RadioListTile(
                              value: 'keywords',
                              onChanged: (String? val) {
                                setState(() {
                                  searchBy = val!;
                                });
                                Navigator.of(context).pop();
                              },
                              //activeColor: Colors.blue,
                              title: const Text("Keywords"),
                              groupValue: searchBy,
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                            RadioListTile(
                              value: 'organs',

                              onChanged: (String? val) {
                                setState(() {
                                  searchBy = val!;
                                });
                                Navigator.of(context).pop();
                              },
                              //activeColor: Colors.blue,
                              title: const Text("Organs System"),
                              groupValue: searchBy,
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ]),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Flexible(
            fit: FlexFit.loose,
            child: FutureBuilder<List<SearchResultItem>>(
                future: result,
                builder: (BuildContext context, AsyncSnapshot<List<SearchResultItem>> future) {
                  var data = future.data;
                  if (data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    var datalength = data.length;
                    if (datalength == 0) {
                      return const Center(
                        child: Text('No data found'),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        cacheExtent: 999,
                        itemCount: future.data!.length,
                        itemBuilder: (context, index) => (future.data![index].visualSummary != null)
                            ? VisualSummaryCard(
                                visualSummary: future.data![index].visualSummary!,
                                onTap: (context) {
                                  () async {
                                    await Navigator.of(context).pushNamed(
                                      "/visual-summary/detail",
                                      arguments:
                                          VisualSummaryDetailPageArguments(future.data![index].visualSummary!.id!),
                                    );
                                    setState(() {
                                      result = IsarService().getSearchResultItems(searchBy, query);
                                    });
                                  }();
                                },
                              )
                            : PodcastCard(
                                podcast: future.data![index].podcast!,
                                onTap: (context) {
                                  () async {
                                    Navigator.of(context).pushNamed(
                                      "/podcast/detail",
                                      arguments: PodcastDetailPageArguments(future.data![index].podcast!.id!),
                                    );
                                    setState(() {
                                      result = IsarService().getSearchResultItems(searchBy, query);
                                    });
                                  }();
                                },
                              ),
                      );
                    }
                  }
                })),
      ],
    );
  }
}
