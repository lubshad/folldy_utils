import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class RecordingControlls extends StatelessWidget {
  const RecordingControlls({
    Key? key,
    required this.startStopRecordingTougle,
    required this.pauseResumeRecordingTougle,
    required this.recordingDuration,
    required this.isPaused,
    required this.isRecording,
  }) : super(key: key);
  final VoidCallback startStopRecordingTougle;
  final VoidCallback pauseResumeRecordingTougle;
  final Stream<Duration> recordingDuration;
  final bool isPaused;
  final bool isRecording;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (!isRecording)
          ElevatedButton.icon(
              onPressed: startStopRecordingTougle,
              icon: const Icon(Icons.keyboard_voice_outlined),
              label: const Text("Start Recording")),
        if (isRecording)
          ElevatedButton.icon(
              onPressed: pauseResumeRecordingTougle,
              icon: Row(
                children: [
                  StreamBuilder<Duration>(
                      stream: recordingDuration,
                      builder: (context, snapshot) {
                        return Text(
                            durationToMs(snapshot.data ?? Duration.zero));
                      }),
                  defaultSpacerHorizontalTiny,
                  Icon(isPaused ? Icons.keyboard_voice_outlined : Icons.pause),
                ],
              ),
              label: Text(isPaused ? "Resume Recording" : "Pause Recording")),
        if (isRecording)
          IconButton(
              onPressed: startStopRecordingTougle, icon: const Icon(Icons.stop))
      ],
    );
  }
}
