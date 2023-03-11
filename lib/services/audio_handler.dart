import 'package:audio_session/audio_session.dart';
import 'package:emoroid_digest_app/utils/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

import '../models/podcast.dart';

Future<AudioHandler> initAudioService() async {
  final session = await AudioSession.instance;
  await session.configure(const AudioSessionConfiguration.speech());
  return AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'Emoroid-Digest-App-Audio',
      androidNotificationChannelName: 'Emoroid Digest App',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
}

class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioPlayerHandler() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.rewind,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.fastForward,
        ],
        systemActions: const {MediaAction.rewind, MediaAction.seek, MediaAction.fastForward},
        androidCompactActionIndices: const [0, 1, 2],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        playing: playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ));
    });
    _player.durationStream.listen((duration) {
      MediaItem oldMedia = mediaItem.value!;
      Podcast? pod = IsarService.getPodcastStatic(oldMedia.id);
      if (pod != null && duration != null) {
        pod.totalDuration = duration.inMilliseconds;
        IsarService.savePodcastStatic(pod);
      }
      mediaItem.add(MediaItem(
          id: oldMedia.id.toString(),
          title: oldMedia.title,
          displayTitle: oldMedia.title,
          duration: duration,
          playable: true,
          extras: {'url': oldMedia.extras!['url']}));
    });
  }

  void dispose() {
    _player.dispose();
    // super.dispose();
  }

  @override
  Future<void> customAction(String name, [Map<String, dynamic>? extras]) async {
    if (name == 'dispose') {
      playbackState.add(playbackState.value.copyWith(
        playing: false,
        controls: [MediaControl.play],
      ));
      await _player.stop();
      super.stop();
    }
    if (name == 'url') {
      playbackState.add(playbackState.value.copyWith(
        controls: [MediaControl.play],
        processingState: AudioProcessingState.loading,
      ));
      _player.setUrl(extras?[0].mediaUrl).then((_) {
        playbackState.add(playbackState.value.copyWith(
          processingState: AudioProcessingState.ready,
        ));
        _player.seek(extras?[2]);
      });
      mediaItem.add(extras?[1]);
    }
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> customStop() => _player.dispose();
}
