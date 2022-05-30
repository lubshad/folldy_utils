import 'package:flutter/material.dart';

enum ElementType {
  text,
  portraitPage,
  landscapePage,
  rectangle,
  circle,
  svg,
  pngText,
}


enum ElementGestureTap {
  changePage,
  showChild,
}

const Size portraitSize = Size(390, 844);
const Size landscapeSize = Size(1280, 720);


enum PresentationMode {
  landscape,
  portrait,
  readmode,
}

extension PresentationModeExtension on PresentationMode {
  String get text {
    switch (this) {
      case PresentationMode.landscape:
        return "landscape";
      case PresentationMode.portrait:
        return "portrait";
      case PresentationMode.readmode:
        return "readmode";
    }
  }

  double get width {
    switch (this) {
      case PresentationMode.landscape:
        return landscapeSize.width;
      case PresentationMode.portrait:
        return portraitSize.width;
      case PresentationMode.readmode:
        return portraitSize.width;
    }
  }

  double get height {
    switch (this) {
      case PresentationMode.landscape:
        return landscapeSize.height;
      case PresentationMode.portrait:
        return portraitSize.height;
      case PresentationMode.readmode:
        return portraitSize.height;
    }
  }

  double get aspectRatio {
    switch (this) {
      case PresentationMode.landscape:
        return landscapeSize.aspectRatio;
      case PresentationMode.portrait:
        return portraitSize.aspectRatio;
      case PresentationMode.readmode:
        return portraitSize.aspectRatio;
    }
  }
}
