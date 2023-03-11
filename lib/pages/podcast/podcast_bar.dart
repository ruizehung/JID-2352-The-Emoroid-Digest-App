import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:emoroid_digest_app/pages/podcast/page_manager.dart';
import 'package:emoroid_digest_app/pages/podcast/podcast_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';

import '../../services/services_locator.dart';

class PodcastBar extends StatefulWidget {
  const PodcastBar({super.key});

  @override
  State<PodcastBar> createState() => _PodcastBarState();
}

extension DurationDivision on Duration {
  double operator /(Duration other) => inMicroseconds / other.inMicroseconds;
}

class _PodcastBarState extends State<PodcastBar> {
  @override
  // final _audioHandler = getIt<AudioHandler>();
  var showBar = true;
  // late final _audioHandler;
  PageManager? _pageManager = PageManager(null, null);
  final navigatorKey = GlobalKey<NavigatorState>();
  final AudioHandler _audioHandler = getIt<AudioHandler>();
  AudioProcessingState processingState = AudioProcessingState.idle;

  @override
  void didChangeDependencies() async {
    // _pageManager = PageManager(_audioHandler);
    _audioHandler.playbackState.listen((playbackState) {
      processingState = playbackState.processingState;
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // },
    return (processingState != AudioProcessingState.idle
        ? Container(
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
                            child: Container(
                                height: 45,
                                child: IconButton(
                                  icon: const Icon(Icons.highlight_remove),
                                  iconSize: 30.0,
                                  onPressed: _pageManager!.dispose,
                                ))),
                        Expanded(
                          flex: 6,
                          child: InkWell(
                              onTap: () {
                                navigatorKey.currentState?.pushReplacementNamed(
                                  "/podcast/detail",
                                  arguments: PodcastDetailPageArguments(value.id),
                                );
                              },
                              child: Center(
                                  child: Container(
                                // width: 10000,
                                height: 45,
                                child: Marquee(
                                    text: value.title,
                                    scrollAxis: Axis.horizontal,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    blankSpace: 50.0,
                                    velocity: 30.0,
                                    pauseAfterRound: Duration(seconds: 1),
                                    startPadding: 10.0,
                                    // accelerationDuration: Duration(seconds: 1),
                                    accelerationCurve: Curves.linear,
                                    // decelerationDuration: Duration(milliseconds: 500),
                                    decelerationCurve: Curves.easeOut,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              ))),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
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
                                          child: Center(child: CircularProgressIndicator()),
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
                    // Container(
                    //   height: 15,
                    //   child: Marquee(text: value.title),
                    // )
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
