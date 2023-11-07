import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.white = true});

  final bool white;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      white ? "assets/pngs/clezz_white.png" : "assets/pngs/clezz_black.png",
      width: 160,
    );
  }
}
