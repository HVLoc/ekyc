import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  static const Color colorLightAccent = Color(0xFFf5f5f5);

  static const Color colorNeutral1 = Color(0xff2B343C);
  static const Color colorNeutral2 = Color(0xff6D737A);
  static const Color colorSemantic3 = Color(0xFFFA1E1E);
  static const Color colorBlueX = Color(0xff36A4F8);

  static Color colorGreyOpacity35 = Colors.grey.withOpacity(0.35);

  static const Color colorTextWhite = Colors.white;
  static const Color colorComment = Color(0xFFACB1B6);
}
