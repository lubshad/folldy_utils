import 'dart:math';

import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/data/models/player_state.dart';
import 'package:folldy_utils/presentation/components/player_controlls.dart';
import 'package:folldy_utils/presentation/elements/element_type.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

import '../../../../utils/constants.dart';

class MinimizedControlls extends StatelessWidget {
  const MinimizedControlls({
    Key? key,
    required this.minimized,
    required this.audioPlayerStateStream,
    required this.seekToDuration,
    // required this.stopPlayer,
    required this.makePlayerFullScreen,
    required this.closePlayer,
    required this.presentation,
    required this.touglePausePlay,
    required this.subject,
  }) : super(key: key);

  final bool minimized;
  final Stream<AudioPlayerState> audioPlayerStateStream;
  final Function(Duration) seekToDuration;
  final dynamic presentation;
  // final VoidCallback stopPlayer;
  final VoidCallback makePlayerFullScreen;
  final VoidCallback closePlayer;
  final VoidCallback touglePausePlay;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: minimized ? 1 : 0,
      duration: defaultAnimationDurationLarge,
      child: IgnorePointer(
        ignoring: !minimized,
        child: GestureDetector(
          onTap: makePlayerFullScreen,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Material(
                  child: Row(
                children: [
                  defaultSpacerHorizontal,
                  SizedBox(
                    height: defaultPaddingLarge * 2.5,
                    child: AspectRatio(
                      aspectRatio: portraitSize.aspectRatio,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: ThumbnailItem(
                          item: presentation["pages"][0],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      dense: true,
                      title: Text(presentation["name"]),
                      subtitle: Text(subject),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: altoGrey,
                    backgroundImage: presentation["profileImage"] == null
                        ? null
                        : CachedNetworkImageProvider(
                            presentation["profileImage"]),
                    child: presentation["profileImage"] == null
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  defaultSpacerHorizontalSmall,
                  StreamBuilder<AudioPlayerState>(
                      stream: audioPlayerStateStream,
                      builder: (context, snapshot) {
                        AudioPlayerState state = snapshot.data ??
                            AudioPlayerState(
                                totalDuration: Duration.zero,
                                elapsedDuration: Duration.zero,
                                playbackSpeed: PlaybackSpeed.x1,
                                isPlaying: false);
                        return CircleAvatar(
                          backgroundColor: altoGrey,
                          child: IconButton(
                              onPressed: touglePausePlay,
                              icon: Icon(state.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow)),
                        );
                      }),
                  IconButton(
                      onPressed: closePlayer, icon: const Icon(Icons.close)),
                ],
              )),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: StreamBuilder<AudioPlayerState>(
                    stream: audioPlayerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data == null
                          ? AudioPlayerState(
                              totalDuration: Duration.zero,
                              elapsedDuration: Duration.zero,
                              playbackSpeed: PlaybackSpeed.x1,
                              isPlaying: false)
                          : snapshot.data!;
                      return SliderTheme(
                        data: SliderThemeData(
                          overlayShape: SliderComponentShape.noOverlay,
                          thumbColor: Colors.red,
                          activeTrackColor: Colors.red,
                          trackHeight: 2,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0),
                        ),
                        child: Material(
                          child: Slider(
                              // key: const Key("minimized"),
                              min: 0,
                              max: playerState.totalDuration.inMilliseconds
                                  .toDouble(),
                              value: min(
                                  playerState.elapsedDuration.inMilliseconds
                                      .toDouble(),
                                  playerState.totalDuration.inMilliseconds
                                      .toDouble()),
                              onChanged: (mills) => seekToDuration(
                                  Duration(milliseconds: mills.toInt()))),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
