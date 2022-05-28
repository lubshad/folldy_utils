import 'dart:math';
import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/data/models/player_state.dart';

class PlayerControlls extends StatelessWidget {
  const PlayerControlls(
      {Key? key,
      required this.play,
      required this.pause,
      required this.playerState,
      required this.seekToDuration})
      : super(key: key);
  final VoidCallback play;
  final VoidCallback pause;
  final Function(Duration) seekToDuration;
  final AudioPlayerState playerState;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Slider(
                min: 0,
                max: playerState.totalDuration.inMilliseconds.toDouble(),
                value: min(
                    playerState.elapsedDuration.inMilliseconds.toDouble(),
                    playerState.totalDuration.inMilliseconds.toDouble()),
                onChanged: (mills) =>
                    seekToDuration(Duration(milliseconds: mills.toInt()))),
            Positioned(
                left: 0,
                child: Text(durationToMs(playerState.elapsedDuration))),
            Positioned(
                right: 0, child: Text(durationToMs(playerState.totalDuration))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: playerState.isPlaying ? pause : play,
                icon: Icon(
                    playerState.isPlaying ? Icons.pause : Icons.play_arrow))
          ],
        )
      ],
    );
  }
}
