import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_type.dart';
import 'package:folldy_utils/presentation/elements/png_text_element.dart';
import 'package:folldy_utils/presentation/elements/portrait_page.dart';
import 'package:folldy_utils/presentation/elements/text_element.dart';

import 'landscape_page.dart';

class PresentationItem extends StatelessWidget {
  const PresentationItem(
      {super.key,
      required this.item,
      this.onTap,
      this.previousPage,
      this.onScreenTap,
      this.onLongPress,
      this.nextPage});

  final Map<String, dynamic> item;
  final Function(Map<String, dynamic> item)? onTap;
  final VoidCallback? previousPage;
  final VoidCallback? nextPage;
  final VoidCallback? onScreenTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    ElementType elementType = ElementType.values[item["type"]];
    switch (elementType) {
      case ElementType.text:
        return TextElementPresnetation(text: item);
      case ElementType.portraitPage:
        return PortraitPage(
          onLongPress: onLongPress!,
          onScreenTap: onScreenTap!,
          item: item,
          onTap: onTap!,
          previousPage: previousPage!,
          nextPage: nextPage!,
        );
      case ElementType.landscapePage:
        return LandscapePage(
            onTap: onTap!, item: item, onScreenTap: onScreenTap!);
      case ElementType.rectangle:
        return Container(
          decoration: BoxDecoration(
            color: Color(item["color"]),
          ),
        );
      case ElementType.circle:
        return Container(
          decoration: BoxDecoration(
              color: Color(item["color"]), shape: BoxShape.circle),
        );
      case ElementType.svg:
        return SvgPicture.network(item["svg"]);
      case ElementType.pngText:
        return PngTextElement(
          item: item,
        );
    }
  }
}

class ThumbnailItem extends StatelessWidget {
  const ThumbnailItem({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    ElementType elementType = ElementType.values[item["type"]];
    switch (elementType) {
      case ElementType.text:
        return TextElementPresnetation(text: item);
      case ElementType.portraitPage:
        return PortraitThumbnail(
          item: item,
        );
      case ElementType.landscapePage:
        return LandscapeThumbnail(item: item);
      case ElementType.rectangle:
        return Container(
          decoration: BoxDecoration(
            color: Color(item["color"]),
          ),
        );
      case ElementType.circle:
        return Container(
          decoration: BoxDecoration(
              color: Color(item["color"]), shape: BoxShape.circle),
        );
      case ElementType.svg:
        return SvgPicture.network(item["svg"]);
      case ElementType.pngText:
        return PngTextElementThumbnail(item: item);
    }
  }
}
