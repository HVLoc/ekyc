import 'dart:ui';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  static const Color colorNeutral1 = Color(0xff2B343C);
  static const Color colorNeutral2 = Color(0xff6D737A);
  static const Color colorSemantic3 = Color(0xFFFA1E1E);
  static const Color colorlueX = Color(0xff36A4F8);
}
