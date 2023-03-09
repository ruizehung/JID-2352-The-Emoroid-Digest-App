import 'package:emoroid_digest_app/models/search_result_item.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_card.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_card.dart';
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
  Future<List<SearchResultItem>> result = IsarService().getSearchResultItems("");

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
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            result = IsarService().getSearchResultItems("");
                          } else {
                            result = IsarService().getSearchResultItems(value);
                          }
                        });
                      },
                      controller: _searchController,
                      autofocus: true,
                      decoration: const InputDecoration(
                          labelText: "Search",
                          hintText: "Search title",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))))),
                ))
              ],
            )),
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
                            ? VisualSummaryCard(visualSummary: future.data![index].visualSummary!)
                            : PodcastCard(podcast: future.data![index].podcast!),
                      );
                    }
                  }
                })),
      ],
    );
  }
}
