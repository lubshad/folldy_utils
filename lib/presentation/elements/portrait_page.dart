import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

import 'package:palette_generator/palette_generator.dart';

// Calculate dominant color from ImageProvider
Future<Color?> getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor?.color;
}

class PortraitPage extends StatelessWidget {
  const PortraitPage({
    super.key,
    required this.item,
    required this.onTap,
    required this.previousPage,
    required this.nextPage,
    required this.onLongPress,
    required this.onScreenTap,
  });
  final Map<String, dynamic> item;
  final Function(Map<String, dynamic> item) onTap;
  final VoidCallback previousPage;
  final VoidCallback nextPage;
  final VoidCallback onScreenTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: item["backgroundImage"] == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(item["backgroundImage"],
                    cacheManager: Get.find<CacheManager>()),
                fit: BoxFit.values[item["fit"]]),
        color: Color(item["color"]),
      ),
      height: item["height"],
      width: item["width"],
      child: Builder(builder: (context) {
        List<dynamic> items = item["items"];
        return Stack(children: [
          FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: GestureDetector(
              onTap: onScreenTap,
              onLongPress: onLongPress,
            ),
          ),
          ...items.map((e) => Positioned(
              top: e["top"],
              left: e["left"],
              height: e["height"],
              width: e["width"],
              child: GestureDetector(
                onTap: e["hidden"] != true && e["topic"] == true
                    ? () => onTap(e)
                    : null,
                child: PresentationItem(item: e),
              ))),
        ]);
      }),
    );
  }
}

class PortraitThumbnail extends StatelessWidget {
  const PortraitThumbnail({
    super.key,
    required this.item,
  });
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: item["backgroundImage"] == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(item["backgroundImage"],
                    cacheManager: Get.find<CacheManager>()),
                fit: BoxFit.values[item["fit"]],
              ),
        color: Color(item["color"]),
      ),
      height: item["height"],
      width: item["width"],
      child: Builder(builder: (context) {
        List<dynamic> items = item["items"];
        return Stack(children: [
          ...items.map((e) => Positioned(
                top: e["top"],
                left: e["left"],
                height: e["height"],
                width: e["width"],
                child: ThumbnailItem(item: e),
              ))
          // )
          ,
        ]);
      }),
    );
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  const Parallax({
    super.key,
    required Widget background,
    this.scrollable,
  }) : super(child: background);

  final ScrollableState? scrollable;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: scrollable ?? Scrollable.of(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context);
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
    required ScrollableState scrollable,
  }) : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints =
        BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction =
        (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}
