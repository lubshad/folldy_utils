import 'package:folldy_utils/presentation/components/player_controlls.dart';

class AudioPlayerState {
  final Duration totalDuration;
  final Duration elapsedDuration;
  final bool isPlaying;
  final PlaybackSpeed playbackSpeed;

  AudioPlayerState(
      {required this.totalDuration,
      required this.elapsedDuration,
      required this.playbackSpeed,
      required this.isPlaying});
}
