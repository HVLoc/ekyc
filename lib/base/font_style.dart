import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/values.src.dart';

class FontStyleUtils {
  static TextStyle fontStyleSans(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.colorTitleAppbar}) {
    return GoogleFonts.nunito().copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle fontStyle(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.colorTitleAppbar}) {
    return GoogleFonts.greatVibes().copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
