import 'package:basic_template/packages/formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/components/color_container.dart';

import '../../../../utils/constants.dart';

class PresentationSlidesAndAudio extends StatelessWidget {
  const PresentationSlidesAndAudio({Key? key, this.presentation})
      : super(key: key);

  final dynamic presentation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!presentation["audio"].isNotEmpty)
          ColorContainer(
              borderRadius: defaultPaddingSmall,
              color: opaqueBlack.withOpacity(.6),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.rectangle_stack,
                    color: Colors.white,
                    size: defaultPadding,
                  ),
                  defaultSpacerHorizontalTiny,
                  Text(
                    presentation["totalSlides"].toString(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
        if (presentation["audio"].isNotEmpty)
          Row(
            children: [
              defaultSpacerHorizontalSmall,
              ColorContainer(
                  borderRadius: defaultPaddingSmall,
                  color: opaqueBlack.withOpacity(.6),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.play_arrow_solid,
                        color: Colors.white,
                        size: defaultPadding,
                      ),
                      Builder(builder: (context) {
                        Duration duration =
                            parseDuration(presentation["audio"][0]["duration"]);
                        return Text(
                          durationToMs(duration),
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white),
                        );
                      })
                    ],
                  )),
            ],
          ),
      ],
    );
  }
}
