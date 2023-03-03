import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/podcast.dart';

class PodcastCard extends StatelessWidget {
  final double iconSize = 25;
  const PodcastCard({super.key, required this.podcast});

  final Podcast podcast;
  // final ValueChanged<String>? onPush;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            "/podcast/detail",
            arguments: PodcastDetailPageArguments(podcast.id!),
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
                            child: Text(podcast.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: const TextStyle(
                                  fontSize: 18,
                                )),
                          ),
                        ),
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
                                child: Text(podcast.giSocietyJournal,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    )),
                              ),
                              Text(
                                podcast.yearGuidelinePublished.toString(),
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
                                    color: podcast.hasRead ? Colors.green : Colors.black,
                                    size: iconSize,
                                  ),
                                ),
                                IconButton(
                                  onPressed: null,
                                  alignment: const Alignment(0, -1),
                                  padding: const EdgeInsets.all(0),
                                  icon: Icon(
                                    podcast.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                                    color: podcast.isFavorite ? Colors.pink : Colors.black,
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
                ))));
  }
}
