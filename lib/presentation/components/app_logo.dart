import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.white = true}) : super(key: key);

  final bool white;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      white ? "assets/pngs/clezz_white.png" : "assets/pngs/clezz_black.png",
      width: 160,
    );
  }
}
