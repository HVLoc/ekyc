import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'values.src.dart';

/// VerySmall - [AppDimens.sizeTextSmaller] = 12
/// Small - [AppDimens.sizeTextSmall] = 14
/// Medium - [AppDimens.sizeTextMediumTb] = 16
/// Large - [AppDimens.sizeTextLarge] = 20
///
/// body - [FontWeight.normal] = w400
/// title - [FontWeight.bold] = w700

// Có thể bổ sung
enum StyleEnum {
  bodyVerySmall,
  bodySmall,
  bodyMedium,
  bodyLarge,
  titleVerySmall,
  titleSmall,
  titleMedium,
  titleLarge,
  titleSupperLarge,
}

class TextUtils extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final StyleEnum? availableStyle;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextStyle? customStyle;
  final FontStyle? fontStyle;
  final bool? isOverflow;
  final TextDecoration? textDecoration;
  final bool isHtml;

  const TextUtils({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.availableStyle,
    this.maxLine,
    this.textAlign,
    this.customStyle,
    this.fontStyle,
    this.isOverflow,
    this.textDecoration,
    this.isHtml = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.openSans().copyWith(
      fontSize: size ?? AppDimens.sizeTextMediumTb,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? const Color(0xFF2B343C),
      wordSpacing: wordSpacing,
      overflow: TextOverflow.ellipsis,
      fontStyle: fontStyle ?? FontStyle.normal,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: const Color(0xff36A4F8),
      decorationThickness: 2,
    );

    if (availableStyle != null) {
      switch (availableStyle!) {
        case StyleEnum.bodyVerySmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmaller,
          );
          break;
        case StyleEnum.bodySmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeText14,
          );
          break;
        case StyleEnum.bodyMedium:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
          );
          break;
        case StyleEnum.bodyLarge:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextLarge,
          );
          break;
        case StyleEnum.titleVerySmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmaller,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.titleSmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeText14,
            fontWeight: FontWeight.bold,
          );
          break;
        // case StyleEnum.titleSmall:
        //   style = style.copyWith(
        //     fontSize: AppDimens.sizeText14,
        //     fontWeight: FontWeight.bold,
        //   );
        //   break;
        case StyleEnum.titleMedium:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.titleLarge:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextLarge,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.titleSupperLarge:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSupperLarge,
            fontWeight: FontWeight.bold,
          );
          break;
        // Có thể bổ sung cho case mới
      }
    }

    return Text(
      text,
      style: customStyle ?? style,
      maxLines: maxLine ?? 1,
      textAlign: textAlign,
      overflow: isOverflow ?? false ? TextOverflow.clip : null,
      softWrap: true,
    );
  }
}
