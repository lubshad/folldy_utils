import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerControlls extends StatelessWidget {
  const PlayerControlls({
    Key? key,
    required this.playPauseTougle,
    required this.audioPlayer,
    required this.duration,
  }) : super(key: key);
  final VoidCallback playPauseTougle;
  final AudioPlayer audioPlayer;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        stream: audioPlayer.positionStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Slider(
                    min: 0,
                    max: duration.inMilliseconds.toDouble(),
                    value: min(snapshot.data?.inMilliseconds.toDouble() ?? 0,
                        duration.inMilliseconds.toDouble()),
                    onChanged: (mills) => audioPlayer
                        .seek(Duration(milliseconds: mills.toInt()))),
                Row(
                  children: [
                    IconButton(
                        onPressed: playPauseTougle,
                        icon: Icon(audioPlayer.playing
                            ? Icons.pause
                            : Icons.play_arrow)),
                  ],
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
