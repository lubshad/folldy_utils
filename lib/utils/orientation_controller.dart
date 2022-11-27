import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationController extends ChangeNotifier {
  static OrientationController get i => Get.find();
  DeviceOrientation orientation = DeviceOrientation.portraitUp;
  changeOrientation(DeviceOrientation newOrientation) {
    orientation = newOrientation;
    notifyListeners();
  }
}
