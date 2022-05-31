class RecordingState {
  final bool isRecording;
  final bool isPaused;
  final Duration recordedDuration;
  final bool isProcessing;

  RecordingState(
      {required this.isRecording,
      required this.isPaused,
      required this.isProcessing,
      required this.recordedDuration});
}
