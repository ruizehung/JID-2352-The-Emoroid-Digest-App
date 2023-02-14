import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/visual_summary.dart';
import 'visual_summaries_thumbnail.dart';

class VisualSummaryCard extends StatelessWidget {
  final double iconSize = 25;
  const VisualSummaryCard({super.key, required this.visualSummary, required this.setVisualSummarySelected});

  final VisualSummary visualSummary;
  final Function(VisualSummary? v) setVisualSummarySelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setVisualSummarySelected(visualSummary);
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
                        child: Thumbnail(visualSummary: visualSummary),
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
                                  color: visualSummary.readStatus ? Colors.green : Colors.black,
                                  size: iconSize,
                                ),
                              ),
                              IconButton(
                                onPressed: null,
                                alignment: const Alignment(0, -1),
                                padding: const EdgeInsets.all(0),
                                icon: Icon(
                                  visualSummary.starStatus ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                  color: visualSummary.starStatus ? Colors.pink : Colors.black,
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
