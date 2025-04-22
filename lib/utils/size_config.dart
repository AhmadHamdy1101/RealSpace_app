import 'package:flutter/material.dart';

abstract class SizeConfig {
  static const double tablet = 600;
  static const double desktop = 1400;
  static late double width, height;

  static init(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
  }
}