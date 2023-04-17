import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:emoroid_digest_app/models/message.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:isar/isar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<Message> _messages = IsarService().getMessages();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 20),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const BackButton(color: Colors.black),
                IconButton(
                    onPressed: () {
                      setState(() {
                        IsarService().clearMessages();
                        _messages = IsarService().getMessages();
                      });
                    },
                    icon: const Icon(Icons.delete)),
              ]),
            )
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    title: Text(_messages[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    subtitle: Text(_messages[index].body,
                        style: const TextStyle(
                          color: Colors.black,
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      if (_messages[index].title.contains('Podcast')) {
                        () async {
                          await Navigator.of(context).pushNamed(
                            "/podcast/detail",
                            arguments: PodcastDetailPageArguments(_messages[index].id),
                          );
                        }();
                      } else if (_messages[index].title.contains('Visual Summary')) {
                        () async {
                          await Navigator.of(context).pushNamed(
                            "/visual-summary/detail",
                            arguments: VisualSummaryDetailPageArguments(_messages[index].id),
                          );
                        }();
                      }
                    },
                  );
                },
              )),
        ))
      ],
    );
  }
}
