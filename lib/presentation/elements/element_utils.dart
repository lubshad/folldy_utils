import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_type.dart';
import 'package:folldy_utils/presentation/elements/png_text_element.dart';
import 'package:folldy_utils/presentation/elements/portrait_page.dart';
import 'package:folldy_utils/presentation/elements/text_element.dart';

import 'landscape_page.dart';

Widget getPresentationItem(dynamic item,
    {Function(dynamic)? handleOnTap , String? baseUrl}) {
  ElementType elementType = ElementType.values[item["type"]];

  switch (elementType) {
    case ElementType.text:
      return TextElementPresnetation(text: item);
    case ElementType.portraitPage:
      return PortraitPage(item: item, handleOnTap: handleOnTap! , baseUrl: baseUrl!);
    case ElementType.landscapePage:
      return LandscapePage(handleOnTap: handleOnTap!, item: item , baseUrl: baseUrl!);
    case ElementType.rectangle:
      return Container(
        decoration: BoxDecoration(
          color: Color(item["color"]),
        ),
      );
    case ElementType.circle:
      return Container(
        decoration:
            BoxDecoration(color: Color(item["color"]), shape: BoxShape.circle),
      );
    case ElementType.svg:
      return SvgPicture.network(item["svg"]);
    case ElementType.pngText:
      return PngTextElement(item: item, baseUrl: baseUrl!);
  }
}

