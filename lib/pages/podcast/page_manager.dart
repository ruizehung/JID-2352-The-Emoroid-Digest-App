import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:emoroid_digest_app/models/podcast.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../services/services_locator.dart';
import '../../services/audio_handler.dart';
import '../../utils/isar_service.dart';

class PageManager {
  final _audioHandler = getIt<AudioHandler>();

  PageManager(Podcast? podcastArgs, Duration? newDuration) {
    _init(_audioHandler, podcastArgs, newDuration);
  }

  void _init(AudioHandler _audioHandler, Podcast? podcastArgs, Duration? newDuration) async {
    if (podcastArgs != null) {
      var mediaItemVar = MediaItem(
          id: podcastArgs.id.toString(),
          title: podcastArgs.title,
          displayTitle: podcastArgs.title,
          duration: podcastArgs.totalDuration != null
              ? Duration(microseconds: (podcastArgs.totalDuration! * 1000).toInt())
              : Duration.zero,
          // artUri: Uri.parse('https://deow9bq0xqvbj.cloudfront.net/image-logo/12400434/Podcast_log0_2-3brd6x.jpg'),
          extras: {'url': podcastArgs.mediaUrl});
      var map = {0: podcastArgs, 1: mediaItemVar, 2: newDuration};
      await _audioHandler.customAction('url', map.cast<String, dynamic>());
    }
    _audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading || processingState == AudioProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        // completed
        _audioHandler.seek(Duration.zero);
        _audioHandler.pause();
      }
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: playbackState.position,
          buffered: playbackState.bufferedPosition,
          total: oldState.total,
          title: oldState.title,
          id: podcastArgs?.id.toString() ?? '');
    });
    AudioService.position.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
        title: oldState.title,
        id: oldState.id,
      );

      if (_audioHandler.mediaItem.value != null) {
        Podcast? pod = IsarService.getPodcastStatic(_audioHandler.mediaItem.value!.id);
        if (pod != null && pod.id == _audioHandler.mediaItem.value!.id) {
          pod.currentDuration = position.inMilliseconds;
          if (pod.currentDuration != 0) {
            IsarService.savePodcastStatic(pod);
          }
        }
      }
    });

    _audioHandler.mediaItem.listen((mediaItem) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: oldState.buffered,
          total: mediaItem?.duration ?? Duration.zero,
          title: mediaItem?.title ?? '',
          id: oldState.id);
    });
  }

  void play() {
    _audioHandler.play();
  }

  void pause() {
    _audioHandler.pause();
  }

  void dispose() {
    progressNotifier.value =
        ProgressBarState(current: Duration.zero, buffered: Duration.zero, total: Duration.zero, title: '', id: '');
    _audioHandler.customAction('dispose');
  }

  void seek(Duration position) {
    _audioHandler.seek(position);
  }

  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
      title: '',
      id: '',
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
    required this.title,
    required this.id,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
  final String title;
  final String id;
}

enum ButtonState { paused, playing, loading }