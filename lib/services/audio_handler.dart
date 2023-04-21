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
      rewindInterval: Duration(seconds: 10),
      fastForwardInterval: Duration(seconds: 10),
    ),
  );
}

MediaControl forward10 = const MediaControl(
  androidIcon: 'drawable/ic_forward_10',
  label: 'Forward 10 Seconds',
  action: MediaAction.fastForward,
);
MediaControl rewind10 = const MediaControl(
  androidIcon: 'drawable/ic_replay_10',
  label: 'Rewind 10 Seconds',
  action: MediaAction.rewind,
);

class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioPlayerHandler() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          rewind10,
          if (playing) MediaControl.pause else MediaControl.play,
          forward10,
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
      Podcast? pod = IsarService.instance.getPodcast(oldMedia.id);
      if (pod != null && duration != null) {
        pod.totalDuration = duration.inMilliseconds;
        IsarService.instance.savePodcast(pod);
      }
      mediaItem.add(MediaItem(
          id: oldMedia.id.toString(),
          title: oldMedia.title,
          displayTitle: oldMedia.title,
          artUri: oldMedia.artUri,
          artist: oldMedia.artist,
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
      _player.setSpeed(1);
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
  Future<void> rewind() => _player.seek(Duration(seconds: _player.position.inSeconds - 10));

  @override
  Future<void> fastForward() => _player.seek(Duration(seconds: _player.position.inSeconds + 10));

  @override
  Future<void> setSpeed(double speed) async {
    _player.setSpeed(speed);
    playbackState.add(playbackState.value.copyWith(speed: speed));
  }

  @override
  Future<void> customStop() => _player.dispose();
}
