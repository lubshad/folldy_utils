import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/components/player_controlls.dart';

class AudioPlayerState {
  final Duration totalDuration;
  final Duration elapsedDuration;
  final bool isPlaying;
  final PlaybackSpeed playbackSpeed;
  final bool isVisible;
  final int totalPages;
  final int currentPage;
  final VoidCallback? navigateToContentEditing;

  AudioPlayerState(
      {required this.totalDuration,
      this.isVisible = true,
      this.navigateToContentEditing,
      this.totalPages = 0,
      this.currentPage = 0,
      required this.elapsedDuration,
      required this.playbackSpeed,
      required this.isPlaying});
}
