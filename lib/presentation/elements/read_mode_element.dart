import 'package:basic_template/basic_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

import '../../utils/constants.dart';

class ReadModeElement {
  final int? id;
  final ReadModeElementType readModeElementType;
  final String? text;
  final String? imageUrl;
  final int displayOrder;
  final double? width;
  final double? height;
  final dynamic child;

  ReadModeElement(
      {this.id,
      this.text,
      this.height = 250,
      this.width = 250,
      this.child,
      this.imageUrl,
      required this.readModeElementType,
      this.displayOrder = 0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'readModeElementType': readModeElementType.index,
      'text': text,
      'imageUrl': imageUrl,
      "width": width,
      "height": height,
      "child": child,
      'displayOrder': displayOrder,
    };
  }

  factory ReadModeElement.fromMap(Map<String, dynamic> map) {
    return ReadModeElement(
      id: 1,
      displayOrder: map['displayOrder'],
      readModeElementType:
          ReadModeElementType.values[map['readModeElementType']],
      text: map['text'],
      width: map["width"],
      height: map["height"],
      child: map["child"],
      imageUrl: map['imageUrl'],
    );
  }

  static List<ReadModeElement> fromList(List<dynamic> list) {
    return list.map((e) => ReadModeElement.fromMap(e)).toList();
  }
}

enum ReadModeElementType { title, image, description, heading, element }

extension ReadModeElementExtension on ReadModeElementType {
  TextStyle get textStyle {
    switch (this) {
      case ReadModeElementType.title:
        return Theme.of(Get.context!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 18, fontFamily: GoogleFonts.tinos().fontFamily);
      case ReadModeElementType.image:
        return Theme.of(Get.context!).textTheme.bodyText1!;
      case ReadModeElementType.description:
        return Theme.of(Get.context!)
            .textTheme
            .bodyText1!
            .copyWith(fontFamily: GoogleFonts.tinos().fontFamily);
      case ReadModeElementType.heading:
        return Theme.of(Get.context!).textTheme.headline6!.copyWith(
            fontFamily: GoogleFonts.tinos().fontFamily,
            fontWeight: FontWeight.w600);
      case ReadModeElementType.element:
        return Theme.of(Get.context!).textTheme.headline6!.copyWith(
            fontFamily: GoogleFonts.tinos().fontFamily,
            fontWeight: FontWeight.w600);
    }
  }
}

class ReadModeItem extends StatelessWidget {
  const ReadModeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ReadModeElement item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: defaultPadding, left: defaultPadding, right: defaultPadding),
      child: Builder(builder: (context) {
        switch (item.readModeElementType) {
          case ReadModeElementType.title:
            return Text("${item.text}",
                style: item.readModeElementType.textStyle);
          case ReadModeElementType.image:
            return Align(
                alignment: Alignment.centerLeft,
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl!,
                  // width: kIsWeb ? 400 : item.width,
                  width: item.width,
                ));
          case ReadModeElementType.description:
            return Text("${item.text}",
                style: item.readModeElementType.textStyle);
          case ReadModeElementType.heading:
            return Text("${item.text}",
                style: item.readModeElementType.textStyle);
          case ReadModeElementType.element:
            return Container(
              width: item.width,
              height: item.height,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(item.imageUrl!),
                      fit: BoxFit.fill)),
              child: FittedBox(child: ThumbnailItem(item: item.child)),
            );
        }
      }),
    );
  }
}
