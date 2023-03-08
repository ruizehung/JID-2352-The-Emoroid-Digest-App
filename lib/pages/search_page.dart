import 'package:emoroid_digest_app/models/master.dart';
import 'package:emoroid_digest_app/models/podcast.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_card.dart';
import 'package:emoroid_digest_app/pages/podcast/podcasts_list_page.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_card.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:flutter/material.dart';
import '../../models/visual_summary.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String search = ""; //for searching
  final searchList = <String>{};
  final TextEditingController _searchController = TextEditingController();
  Future<List<Master>> result = IsarService().getMasterList();

  bool isSearch = false;

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
                          if (value == "") {
                            print(value);
                            result = IsarService().getMasterList();
                          }
                          result = _initialList();
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
            child: FutureBuilder<List<Master>>(
                future: result,
                builder: (BuildContext context, AsyncSnapshot<List<Master>> future) {
                  var data = future.data;
                  if (data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    var datalength = data.length;
                    if (datalength == 0) {
                      return const Center(
                        child: Text('no data found'),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        cacheExtent: 999,
                        itemCount: future.data!.length,
                        itemBuilder: (context, index) => (future.data![index] is VisualSummary)
                            ? VisualSummaryCard(visualSummary: future.data![index] as VisualSummary)
                            : PodcastCard(podcast: future.data![index] as Podcast),
                        //   print("ss");
                        //   if (future.data![index] is VisualSummary) {
                        //     print(future.data![index]);
                        //     VisualSummaryCard(
                        //       visualSummary: future.data![index] as VisualSummary,
                        //     );
                        //   } else {
                        //     print("pod");
                        //     PodcastCard(
                        //       podcast: future.data![index] as Podcast,
                        //     );
                        //   }
                        // }
                      );
                    }
                  }

                  ;
                })),
      ],
    );
  }

//   Future<List<Master>> combineLists() async{
//     int a = 01;
// return a;
//     //print(a);
//   }

  Future<List<Master>> _initialList() async {
    Set<Master> msSet = Set();

    Future<List<VisualSummary>> s = IsarService().getVisualSummariesWithThumbnail();
    await s.then((value) {
      for (var vs in value) {
        msSet.add(vs);
      }
    });
    Future<List<Podcast>> p = IsarService().getPodcasts();
    await p.then((value) {
      for (var pc in value) {
        msSet.add(pc);
      }
    });
    //  print(vs.length);
    //print(pc.length);
    List<Master> ms = msSet.toList();

    return ms;
  }

  void assd() {
    VisualSummary f = VisualSummary();
    Set<VisualSummary> a = Set();
    a.add(f);
    Future<List<Master>> result = IsarService().getVisualSummariesWithThumbnail();
    result.then((value) => (f = value[1] as VisualSummary));
  }
}
