import 'package:flutter/material.dart';

extension TextDecorationExtension on String {
  TextDecoration get textDecoration {
    switch (this) {
      case 'TextDecoration.underline':
        return TextDecoration.underline;
      case 'TextDecoration.lineThrough':
        return TextDecoration.lineThrough;
      case 'TextDecorationoverline':
        return TextDecoration.overline;
      default:
        return TextDecoration.none;
    }
  }
}