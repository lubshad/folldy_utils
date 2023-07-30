import 'package:basic_template/basic_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/data/models/player_state.dart';
import 'package:folldy_utils/presentation/elements/element_type.dart';
import 'package:folldy_utils/utils/constants.dart';

import 'color_container.dart';

class RecordingScreenAppBar extends StatelessWidget {
  const RecordingScreenAppBar({
    Key? key,
    required this.onReadmodeTap,
    required this.profileUrl,
    required this.playerState,
    this.tougleOrientation,
    required this.minimize,
  }) : super(key: key);
  final VoidCallback onReadmodeTap;
  final Stream<AudioPlayerState> playerState;
  final VoidCallback minimize;
  final VoidCallback? tougleOrientation;

  final String? profileUrl;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Builder(builder: (context) {
        BoxConstraints constraints = BoxConstraints(maxWidth: size.width);
        if (orientation == Orientation.landscape) {
          double height = size.height;
          double presentationWidth =
              PresentationMode.landscape.aspectRatio * height;
          constraints = BoxConstraints(maxWidth: presentationWidth);
        }
        return ConstrainedBox(
          constraints: constraints,
          child: Row(
            children: [
              Expanded(
                  child: StreamBuilder<AudioPlayerState>(
                      stream: playerState,
                      builder: (context, snapshot) {
                        return AnimatedOpacity(
                          opacity: snapshot.data?.isVisible == true ? 1 : 0,
                          duration: defaultAnimationDuration,
                          child: IgnorePointer(
                            ignoring:
                                snapshot.data?.isVisible == true ? false : true,
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
                                          onPressed: minimize,
                                          icon: Builder(builder: (context) {
                                            return Icon(
                                              orientation ==
                                                      Orientation.landscape
                                                  ? CupertinoIcons.chevron_back
                                                  : CupertinoIcons.chevron_down,
                                              color: Colors.white,
                                            );
                                          })),
                                    )),
                                const Spacer(),
                                if (tougleOrientation != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: defaultPaddingSmall),
                                    child: ColorContainer(
                                        borderRadius: defaultPaddingLarge,
                                        color: opaqueBlack,
                                        child: SizedBox(
                                          width: defaultPaddingLarge,
                                          height: defaultPaddingLarge,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: tougleOrientation,
                                            // icon: SvgPicture.asset(
                                            //   "assets/svgs/readmode.svg",
                                            //   height: defaultPadding * 1.3,
                                            //   width: defaultPadding * 1.3,
                                            // ),
                                            icon: const Icon(
                                              Icons.screen_rotation_outlined,
                                              size: defaultPadding,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ),
                                if (snapshot.data?.navigateToContentEditing !=
                                    null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: defaultPaddingSmall),
                                    child: ColorContainer(
                                        borderRadius: defaultPaddingLarge,
                                        color: opaqueBlack,
                                        child: SizedBox(
                                          width: defaultPaddingLarge,
                                          height: defaultPaddingLarge,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: snapshot
                                                .data?.navigateToContentEditing,
                                            // icon: SvgPicture.asset(
                                            //   "assets/svgs/readmode.svg",
                                            //   height: defaultPadding * 1.3,
                                            //   width: defaultPadding * 1.3,
                                            // ),
                                            icon: const Icon(
                                              Icons.edit,
                                              size: defaultPadding,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ),
                                ColorContainer(
                                    borderRadius: defaultPaddingLarge,
                                    color: opaqueBlack,
                                    child: SizedBox(
                                      height: defaultPaddingLarge,
                                      child: Center(
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal:
                                                    defaultPaddingSmall),
                                            child: Builder(builder: (context) {
                                              int totalPages =
                                                  snapshot.data?.totalPages ??
                                                      0;
                                              int currentPage =
                                                  snapshot.data?.currentPage ??
                                                      0;
                                              return Text(
                                                  "$currentPage/$totalPages",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.white));
                                            })),
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
                                if (orientation == Orientation.landscape)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: defaultPaddingSmall),
                                    child: CircleAvatar(
                                      backgroundColor: altoGrey,
                                      backgroundImage: profileUrl == null
                                          ? null
                                          : CachedNetworkImageProvider(
                                              profileUrl!,
                                              maxHeight: 200,
                                              maxWidth: 200),
                                      child: profileUrl == null
                                          ? const Icon(Icons.person)
                                          : null,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        );
                      })),
              if (orientation == Orientation.portrait)
                CircleAvatar(
                  backgroundColor: altoGrey,
                  backgroundImage: profileUrl == null
                      ? null
                      : CachedNetworkImageProvider(profileUrl!,
                          maxHeight: 200, maxWidth: 200),
                  child: profileUrl == null ? const Icon(Icons.person) : null,
                )
            ],
          ),
        );
      }),
    );
  }
}
