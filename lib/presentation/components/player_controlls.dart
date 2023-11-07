import 'dart:math';
import 'package:basic_template/basic_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/data/models/player_state.dart';
import 'package:folldy_utils/utils/constants.dart';

class PlayerControlls extends StatelessWidget {
  const PlayerControlls(
      {super.key,
      required this.play,
      required this.popupButton,
      required this.pause,
      required this.playerState,
      required this.skipBackward,
      required this.skipForward,
      required this.changePlaybackSpeed,
      required this.seekToDuration});
  final VoidCallback play;
  final VoidCallback pause;
  final VoidCallback skipForward;
  final VoidCallback skipBackward;
  final Function(Duration) seekToDuration;
  final Function(double) changePlaybackSpeed;
  final AudioPlayerState playerState;
  final Widget popupButton;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: playerState.isVisible ? 1 : 0,
      duration: defaultTransitionDuration,
      child: IgnorePointer(
        ignoring: !playerState.isVisible,
        child: IconTheme(
          data: const IconThemeData(color: Colors.white),
          child: Column(
            children: [
              Stack(
                children: [
                  Slider(
                      min: 0,
                      max: playerState.totalDuration.inMilliseconds.toDouble(),
                      value: min(
                          playerState.elapsedDuration.inMilliseconds.toDouble(),
                          playerState.totalDuration.inMilliseconds.toDouble()),
                      onChanged: (mills) => seekToDuration(
                          Duration(milliseconds: mills.toInt()))),
                  Positioned(
                      left: defaultPadding,
                      bottom: 0,
                      child: Text(
                        durationToMs(playerState.elapsedDuration),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      )),
                  Positioned(
                      right: defaultPadding,
                      bottom: 0,
                      child: Text(
                        durationToMs(playerState.totalDuration),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      )),
                ],
              ),
              ButtonTheme(
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleContainer(
                      child: SizedBox(
                        width: defaultPaddingLarge * 1.4,
                        height: defaultPaddingLarge * 1.4,
                        child: IconButton(
                            onPressed: () => Get.bottomSheet(
                                PlaybackSpeedSelection(
                                  currentSpeed: playerState.playbackSpeed,
                                  changePlaybackSpeed: changePlaybackSpeed,
                                ),
                                isScrollControlled: true),
                            icon: Text(
                              playerState.playbackSpeed.speedText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            )),
                      ),
                    ),
                    CircleContainer(
                      child: SizedBox(
                        width: defaultPaddingLarge * 1.4,
                        height: defaultPaddingLarge * 1.4,
                        child: IconButton(
                            onPressed: skipBackward,
                            icon: const Icon(Icons.replay_10_outlined)),
                      ),
                    ),
                    CircleContainer(
                      child: IconButton(
                          iconSize: defaultPaddingLarge,
                          padding: const EdgeInsets.all(defaultPadding),
                          onPressed: playerState.isPlaying ? pause : play,
                          icon: Icon(playerState.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow)),
                    ),
                    CircleContainer(
                      child: SizedBox(
                        width: defaultPaddingLarge * 1.4,
                        height: defaultPaddingLarge * 1.4,
                        child: IconButton(
                            onPressed: skipForward,
                            icon: const Icon(Icons.forward_10_outlined)),
                      ),
                    ),
                    popupButton
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlaybackSpeedSelection extends StatelessWidget {
  const PlaybackSpeedSelection(
      {super.key,
      required this.changePlaybackSpeed,
      required this.currentSpeed});
  final PlaybackSpeed currentSpeed;
  final Function(double) changePlaybackSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...PlaybackSpeed.values.map((speed) => ListTile(
                onTap: () {
                  changePlaybackSpeed(speed.speed);
                  Get.back();
                },
                dense: true,
                title: Text(speed.speedText),
                leading: currentSpeed == speed
                    ? const Icon(CupertinoIcons.checkmark_alt)
                    : null,
              )),
          const Divider(),
          ListTile(
              onTap: Get.back,
              title: const Text("Cancel"),
              leading: const Icon(Icons.close))
        ],
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    required this.child,
    this.color = opaqueBlack,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: child,
    );
  }
}

enum PlaybackSpeed {
  x025,
  x050,
  x075,
  x1,
  x125,
  x150,
  x175,
  x2,
}

extension PlaybackSpeedExtension on PlaybackSpeed {
  String get speedText {
    switch (this) {
      case PlaybackSpeed.x025:
        return '0.25x';
      case PlaybackSpeed.x050:
        return '0.5x';
      case PlaybackSpeed.x1:
        return '1.0x';
      case PlaybackSpeed.x125:
        return '1.25x';
      case PlaybackSpeed.x2:
        return '2x';
      case PlaybackSpeed.x075:
        return '0.75x';
      case PlaybackSpeed.x150:
        return '1.5x';
      case PlaybackSpeed.x175:
        return '1.75x';
    }
  }

  double get speed {
    switch (this) {
      case PlaybackSpeed.x025:
        return 0.25;
      case PlaybackSpeed.x050:
        return 0.5;
      case PlaybackSpeed.x1:
        return 1.0;
      case PlaybackSpeed.x125:
        return 1.25;
      case PlaybackSpeed.x2:
        return 2.0;
      case PlaybackSpeed.x075:
        return 0.75;
      case PlaybackSpeed.x150:
        return 1.5;
      case PlaybackSpeed.x175:
        return 1.75;
    }
  }
}

extension DoubleExtension on double {
  PlaybackSpeed get playbackSpeed {
    if (this == 0.25) {
      return PlaybackSpeed.x025;
    } else if (this == 0.5) {
      return PlaybackSpeed.x050;
    } else if (this == 1.0) {
      return PlaybackSpeed.x1;
    } else if (this == 1.25) {
      return PlaybackSpeed.x125;
    } else if (this == 2.0) {
      return PlaybackSpeed.x2;
    } else if (this == 0.75) {
      return PlaybackSpeed.x075;
    } else if (this == 1.5) {
      return PlaybackSpeed.x150;
    } else if (this == 1.75) {
      return PlaybackSpeed.x175;
    } else {
      return PlaybackSpeed.x1;
    }
  }
}
