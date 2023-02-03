import 'package:flutter/material.dart';
import '../models/visual_summary.dart';
import 'visual_summaries_thumbnail.dart';

class VisualSummaryCard extends StatelessWidget {
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
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
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Thumbnail(visualSummary: visualSummary),
                    ),
                  )
                ],
              )),
        ));
  }
}
