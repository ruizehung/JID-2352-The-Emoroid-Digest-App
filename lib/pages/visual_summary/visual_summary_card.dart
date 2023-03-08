import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/visual_summary.dart';
import 'visual_summaries_thumbnail.dart';

class VisualSummaryCard extends StatefulWidget {
  const VisualSummaryCard({super.key, required this.id});

  final String id;

  @override
  State<VisualSummaryCard> createState() => _VisualSummaryCardState();
}

class _VisualSummaryCardState extends State<VisualSummaryCard> {
  final double iconSize = 25;
  late VisualSummary visualSummary;

  @override
  void initState() {
    super.initState();
    setState(() {
      visualSummary = IsarService().getVisualSummary(widget.id)!;
    });

    Stream<VisualSummary?> visualSummaryChanged = IsarService().getVisualSummaryWatchingObj(widget.id);

    visualSummaryChanged.listen((newVisualSummary) {
      if (newVisualSummary != null) {
        setState(() {
          visualSummary = newVisualSummary;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            "/visual-summary/detail",
            arguments: VisualSummaryDetailPageArguments(visualSummary.id!),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8),
          child: Card(
              elevation: 3,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(visualSummary.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: const TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: VisualSummaryThumbnail(visualSummary: visualSummary),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 70,
                              child: Text(visualSummary.giSocietyJournal.join(", "),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  )),
                            ),
                            Text(
                              visualSummary.yearGuidelinePublished.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: null,
                                alignment: const Alignment(0, -1),
                                padding: const EdgeInsets.all(0),
                                icon: Icon(
                                  CupertinoIcons.eye,
                                  color: visualSummary.hasRead ? Colors.green : Colors.black,
                                  size: iconSize,
                                ),
                              ),
                              IconButton(
                                onPressed: null,
                                alignment: const Alignment(0, -1),
                                padding: const EdgeInsets.all(0),
                                icon: Icon(
                                  visualSummary.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                  color: visualSummary.isFavorite ? Colors.pink : Colors.black,
                                  size: iconSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
