class RecordingState {
  final bool isRecording;
  final bool isPaused;
  final Duration recordedDuration;

  RecordingState(
      {required this.isRecording,
      required this.isPaused,
      required this.recordedDuration});
}