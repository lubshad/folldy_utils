import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ReadModeElement {
  final int? id;
  final ReadModeElementType readModeElementType;
  final String? text;
  final String? imageUrl;
  final int displayOrder;

  ReadModeElement(
      {this.id,
      this.text,
      this.imageUrl,
      required this.readModeElementType,
      this.displayOrder = 0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'readModeElementType': readModeElementType.index,
      'text': text,
      'imageUrl': imageUrl,
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
      imageUrl: map['imageUrl'],
    );
  }

  static List<ReadModeElement> fromList(List<dynamic> list) {
    return list.map((e) => ReadModeElement.fromMap(e)).toList();
  }
}

enum ReadModeElementType {
  title,
  image,
  description,
}

extension ReadModeElementExtension on ReadModeElementType {
  TextStyle get textStyle {
    switch (this) {
      case ReadModeElementType.title:
        return Theme.of(Get.context!)
            .textTheme
            .headline6!
            .copyWith(fontFamily: GoogleFonts.tinos().fontFamily);
      case ReadModeElementType.image:
        return Theme.of(Get.context!).textTheme.bodyText1!;
      case ReadModeElementType.description:
        return Theme.of(Get.context!)
            .textTheme
            .bodyText1!
            .copyWith(fontFamily: GoogleFonts.tinos().fontFamily);
    }
  }
}

class ReadModeItem extends StatelessWidget {
  const ReadModeItem({
    Key? key,
    required this.item,
    required this.domainUrl,
  }) : super(key: key);

  final ReadModeElement item;
  final String domainUrl;

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
            return CachedNetworkImage(imageUrl: domainUrl + item.imageUrl!);
          case ReadModeElementType.description:
            return Text("${item.text}",
                style: item.readModeElementType.textStyle);
        }
      }),
    );
  }
}
