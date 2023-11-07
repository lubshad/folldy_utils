import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    this.color = altoGrey,
    this.borderWidth,
    this.borderRadius = defaultPaddingTiny,
    required this.child,
  });
  final Widget child;
  final Color color;
  final double borderRadius;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(defaultPaddingTiny),
        decoration: BoxDecoration(
            border: borderWidth == null ? null : Border.all(color: altoGrey),
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: child);
  }
}
