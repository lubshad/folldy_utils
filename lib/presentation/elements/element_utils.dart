import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_type.dart';
import 'package:folldy_utils/presentation/elements/png_text_element.dart';
import 'package:folldy_utils/presentation/elements/portrait_page.dart';
import 'package:folldy_utils/presentation/elements/text_element.dart';

import 'landscape_page.dart';

class PresentationItem extends StatelessWidget {
  const PresentationItem(
      {Key? key,
      required this.item,
      this.onTap,
      required this.domainUrl,
      this.previousPage,
      this.nextPage})
      : super(key: key);

  final Map<String, dynamic> item;
  final Function(Map<String, dynamic> item)? onTap;
  final String domainUrl;
  final VoidCallback? previousPage;
  final VoidCallback? nextPage;

  @override
  Widget build(BuildContext context) {
    ElementType elementType = ElementType.values[item["type"]];
    switch (elementType) {
      case ElementType.text:
        return TextElementPresnetation(text: item);
      case ElementType.portraitPage:
        return PortraitPage(
          item: item,
          onTap: onTap!,
          domainUrl: domainUrl,
          previousPage: previousPage!,
          nextPage: nextPage!,
        );
      case ElementType.landscapePage:
        return LandscapePage(onTap: onTap!, item: item, domainUrl: domainUrl);
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
        return PngTextElement(item: item, domainUrl: domainUrl);
    }
  }
}

class ThumbnailItem extends StatelessWidget {
  const ThumbnailItem({Key? key, required this.item, required this.domainUrl})
      : super(key: key);

  final Map<String, dynamic> item;
  final String domainUrl;

  @override
  Widget build(BuildContext context) {
    ElementType elementType = ElementType.values[item["type"]];
    switch (elementType) {
      case ElementType.text:
        return TextElementPresnetation(text: item);
      case ElementType.portraitPage:
        return PortraitThumbnail(
          item: item,
          domainUrl: domainUrl,
        );
      case ElementType.landscapePage:
        return LandscapeThumbnail(item: item, domainUrl: domainUrl);
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
        return PngTextElementThumbnail(item: item, domainUrl: domainUrl);
    }
  }
}
