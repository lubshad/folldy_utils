import 'package:basic_template/basic_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/data/models/recording_state.dart';

import '../../utils/constants.dart';

class RecordingControlls extends StatelessWidget {
  const RecordingControlls({
    Key? key,
    required this.startRecording,
    required this.stopRecording,
    required this.pauseRecording,
    required this.resumeRecording,
    required this.recordingState,
  }) : super(key: key);
  final VoidCallback startRecording;
  final VoidCallback stopRecording;
  final VoidCallback pauseRecording;
  final VoidCallback resumeRecording;
  final RecordingState recordingState;

  @override
  Widget build(BuildContext context) {
    return recordingState.isProcessing
        ? const Center(child: CircularProgressIndicator())
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!recordingState.isRecording)
                ElevatedButton.icon(
                    onPressed: startRecording,
                    icon: const Icon(Icons.videocam_rounded),
                    label: const Text("Start Recording")),
              if (recordingState.isRecording)
                ElevatedButton.icon(
                    onPressed: recordingState.isPaused
                        ? resumeRecording
                        : pauseRecording,
                    icon: Row(
                      children: [
                        Text(durationToMs(recordingState.recordedDuration)),
                        defaultSpacerHorizontalTiny,
                        Icon(recordingState.isPaused
                            ? Icons.keyboard_voice_outlined
                            : Icons.pause),
                      ],
                    ),
                    label: Text(recordingState.isPaused
                        ? "Resume Recording"
                        : "Pause Recording")),
              if (recordingState.isRecording)
                IconButton(
                    onPressed: stopRecording,
                    icon: const Icon(CupertinoIcons.stop_circle,
                        color: Colors.red), iconSize: defaultPaddingLarge,),
            ],
          );
  }
}
