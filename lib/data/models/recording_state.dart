class RecordingState {
  final bool isRecording;
  final bool isPaused;
  final Duration recordedDuration;
  final bool isProcessing;
  final bool isVisible;

  RecordingState(
      {required this.isRecording,
      required this.isPaused,
      required this.isProcessing,
      required this.isVisible,
      required this.recordedDuration});
}
