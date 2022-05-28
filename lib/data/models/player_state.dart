class AudioPlayerState {
  final Duration totalDuration;
  final Duration elapsedDuration;
  final bool isPlaying;

  AudioPlayerState({required this.totalDuration, required this.elapsedDuration, required this.isPlaying});
}
