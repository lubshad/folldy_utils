import 'package:folldy_utils/presentation/components/player_controlls.dart';

class AudioPlayerState {
  final Duration totalDuration;
  final Duration elapsedDuration;
  final bool isPlaying;
  final PlaybackSpeed playbackSpeed;
  final bool isVisible;

  AudioPlayerState(
      {required this.totalDuration,
       this.isVisible = true,
      required this.elapsedDuration,
      required this.playbackSpeed,
      required this.isPlaying});
}
