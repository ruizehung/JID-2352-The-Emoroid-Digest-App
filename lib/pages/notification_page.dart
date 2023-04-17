import 'dart:async';
import 'package:flutter/material.dart';
import 'package:emoroid_digest_app/pages/visual_summary/visual_summary_detail_page.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:emoroid_digest_app/models/message.dart';
import 'package:provider/provider.dart';
import 'global_navigation_state.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Message> _messages = IsarService().getMessages();
  late StreamSubscription<int> notificationStream;

  @override
  void initState() {
    super.initState();
    // Initialize the list of messages from the database
    _messages = IsarService().getMessages();
    notificationStream = IsarService().getMessageCountStream().listen((count) {
      if (mounted) {
        setState(() {
          _messages = IsarService().getMessages();
        });
      }
    });
  }

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
                BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
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
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (_messages[index].title.contains('Podcast')) {
                        () async {
                          Provider.of<GlobalNavigationState>(context, listen: false).page = 2;
                          await Navigator.of(context).pushNamed(
                            "/podcast/detail",
                            arguments: PodcastDetailPageArguments(_messages[index].id),
                          );
                          // ignore: use_build_context_synchronously
                          Provider.of<GlobalNavigationState>(context, listen: false).updateBasedOnRoute();
                        }();
                      } else if (_messages[index].title.contains('Visual Summary')) {
                        () async {
                          Provider.of<GlobalNavigationState>(context, listen: false).page = 0;
                          await Navigator.of(context).pushNamed(
                            "/visual-summary/detail",
                            arguments: VisualSummaryDetailPageArguments(_messages[index].id),
                          );
                          // ignore: use_build_context_synchronously
                          Provider.of<GlobalNavigationState>(context, listen: false).updateBasedOnRoute();
                        }();
                      }
                    },
                    child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            const Text(' '),
                            Text(
                              _messages[index].title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(_messages[index].body),
                            const Text(' '),
                          ],
                        )),
                  );
                },
              )),
        ))
      ],
    );
  }
}
