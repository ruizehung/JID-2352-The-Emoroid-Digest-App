import 'package:flutter/material.dart';

class PodcastDetailPageArguments {
  final String podcastID;

  PodcastDetailPageArguments(this.podcastID);
}

class PodcastDetailPage extends StatefulWidget {
  const PodcastDetailPage({super.key});

  @override
  State<PodcastDetailPage> createState() => _PodcastDetailPageState();
}

class _PodcastDetailPageState extends State<PodcastDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PodcastDetailPageArguments;
    // final podcast = IsarService().getPodcast(args.podcastID);
    return const Text("This is a podcast detail page.");
  }
}
