import 'package:flutter/material.dart';
import 'package:folldy_utils/utils/extensions.dart';

class TextElementPresnetation extends StatelessWidget {
  const TextElementPresnetation({
    Key? key,
    this.text,
  }) : super(key: key);

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    String? decoration = text["decoration"];
    TextDecoration textDecoration =
        decoration == null ? TextDecoration.none : decoration.textDecoration;
    FontStyle fontStyle = text["fontStyle"] == null
        ? FontStyle.normal
        : FontStyle.values[text["fontStyle"]];
    FontWeight fontWeight = FontWeight.values[text["fontWeight"]];
    return Visibility(
      visible: text["hidden"] != true,
      child: IgnorePointer(
        ignoring: text["topic"] != true,
        child: Text(
          text["text"],
          textAlign: TextAlign.values[text["textAlign"]],
          style: TextStyle(
              decoration: textDecoration,
              fontSize: text["fontSize"],
              color: Color(text["color"]),
              fontFamily: text["fontFamily"],
              height: text["lineSpacing"],
              fontStyle: fontStyle,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
