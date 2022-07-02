import 'package:basic_template/basic_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/utils/constants.dart';

import 'color_container.dart';

class RecordingScreenAppBar extends StatelessWidget {
  const RecordingScreenAppBar({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onReadmodeTap,
    required this.isVisible,
    required this.profileUrl,
  }) : super(key: key);

  final int totalPages;
  final int currentPage;
  final VoidCallback onReadmodeTap;
  final bool isVisible;
  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Expanded(
            child: AnimatedOpacity(
                  opacity: isVisible ? 1 : 0,
                  duration: defaultAnimationDuration,
                  child: IgnorePointer(
                    ignoring: !isVisible,
                    child: Row(
                      children: [
                        ColorContainer(
                            borderRadius: defaultPaddingLarge,
                            color: opaqueBlack,
                            child: SizedBox(
                              width: defaultPaddingLarge,
                              height: defaultPaddingLarge,
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: Get.back,
                                  icon: const Icon(
                                    CupertinoIcons.back,
                                    color: Colors.white,
                                  )),
                            )),
                        const Spacer(),
                        ColorContainer(
                            borderRadius: defaultPaddingLarge,
                            color: opaqueBlack,
                            child: SizedBox(
                              height: defaultPaddingLarge,
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultPaddingSmall),
                                    child: Text("$currentPage/$totalPages",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(color: Colors.white))),
                              ),
                            )),
                        defaultSpacerHorizontalSmall,
                        ColorContainer(
                            borderRadius: defaultPaddingLarge,
                            color: opaqueBlack,
                            child: SizedBox(
                              width: defaultPaddingLarge,
                              height: defaultPaddingLarge,
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: onReadmodeTap,
                                  icon: SvgPicture.asset(
                                    "assets/svgs/readmode.svg",
                                    height: defaultPadding * 1.3,
                                    width: defaultPadding * 1.3,
                                  )),
                            )),
                        defaultSpacerHorizontalSmall,
                      ],
                    ),
                  ),
                )
          ),
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(profileUrl,
                maxHeight: 200, maxWidth: 200),
          )
        ],
      ),
    );
  }
}

