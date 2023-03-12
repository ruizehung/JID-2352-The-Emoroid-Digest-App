import 'package:audio_service/audio_service.dart';
import 'package:emoroid_digest_app/pages/podcast/page_manager.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../../services/services_locator.dart';
import '../bottom_nav_bar_state.dart';

class PodcastBar extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const PodcastBar({super.key, required this.navigatorKey});

  @override
  State<PodcastBar> createState() => _PodcastBarState();
}

extension DurationDivision on Duration {
  double operator /(Duration other) => inMicroseconds / other.inMicroseconds;
}

class _PodcastBarState extends State<PodcastBar> {
  var showBar = true;
  PageManager? _pageManager = PageManager(null, null);
  final AudioHandler _audioHandler = getIt<AudioHandler>();
  AudioProcessingState processingState = AudioProcessingState.idle;

  @override
  void didChangeDependencies() async {
    _audioHandler.playbackState.listen((playbackState) {
      processingState = playbackState.processingState;
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarState = Provider.of<BottomNavBarState>(context);

    return (processingState != AudioProcessingState.idle
        ? SizedBox(
            height: 50,
            child: ValueListenableBuilder<ProgressBarState>(
              valueListenable: _pageManager!.progressNotifier,
              builder: (_, value, __) {
                return Column(
                  children: [
                    // Text('${value.current / value.total}'),
                    LinearProgressIndicator(
                      value: (value.current / value.total).isNaN || (value.current / value.total).isInfinite
                          ? 0
                          : (value.current / value.total),
                      semanticsLabel: 'Linear progress indicator',
                    ),
                    Row(
                      // children: [Container(width: 100, height: 20, child: Marquee(text: value.title))],
                      children: <Widget>[
                        Expanded(
                            child: SizedBox(
                                height: 45,
                                child: IconButton(
                                  icon: const Icon(Icons.highlight_remove),
                                  iconSize: 30.0,
                                  onPressed: _pageManager!.dispose,
                                ))),
                        Expanded(
                          flex: 6,
                          child: InkWell(
                              onTap: () async {
                                bottomNavBarState.page = 2;
                                await widget.navigatorKey.currentState?.pushReplacementNamed(
                                  "/podcast/detail",
                                  arguments: PodcastDetailPageArguments(value.id),
                                );
                                bottomNavBarState.updateBasedOnRoute();
                              },
                              child: Center(
                                  child: SizedBox(
                                height: 45,
                                child: Marquee(
                                    text: value.title,
                                    scrollAxis: Axis.horizontal,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    blankSpace: 50.0,
                                    velocity: 30.0,
                                    pauseAfterRound: const Duration(seconds: 1),
                                    startPadding: 10.0,
                                    // accelerationDuration: Duration(seconds: 1),
                                    accelerationCurve: Curves.linear,
                                    // decelerationDuration: Duration(milliseconds: 500),
                                    decelerationCurve: Curves.easeOut,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              ))),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                              height: 45,
                              // width: 45,
                              child: ValueListenableBuilder<ButtonState>(
                                  valueListenable: _pageManager!.buttonNotifier,
                                  builder: (_, value, __) {
                                    switch (value) {
                                      case ButtonState.loading:
                                        return Container(
                                          margin: const EdgeInsets.all(10.0),
                                          // width: 45.0,
                                          // height: 32.0,
                                          child: const Center(child: CircularProgressIndicator()),
                                        );
                                      case ButtonState.paused:
                                        return IconButton(
                                          icon: const Icon(Icons.play_arrow),
                                          iconSize: 30.0,
                                          onPressed: _pageManager!.play,
                                        );
                                      case ButtonState.playing:
                                        return IconButton(
                                          icon: const Icon(Icons.pause),
                                          iconSize: 30.0,
                                          onPressed: _pageManager!.pause,
                                        );
                                    }
                                  })),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          )
        : Container(
            height: 0,
          ));
  }
}
