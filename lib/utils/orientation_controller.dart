import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

class OrientationController extends ChangeNotifier {
  static OrientationController get i => Get.find();
  Orientation orientation = Orientation.portrait;
  changeOrientation(Orientation newOrientation) {
    orientation = newOrientation;
    notifyListeners();
  }
}
