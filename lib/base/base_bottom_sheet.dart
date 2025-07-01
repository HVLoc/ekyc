import 'package:ekyc/values/values.src.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseBottomSheet {
  /// Base for bottom sheet
  static Widget build({
    required String title,
    required Widget body,
    Widget? iconTitle,
    bool isSecondDisplay = false,
    Widget? actionArrowBack,
    double? padding,
    bool noHeader = false,
    Color? backgroundColor,
    TextAlign? textAlign,
    double? height,
  }) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
          top: Get.mediaQuery.padding.top + (isSecondDisplay ? 100 : 20)),
      child: Container(
        height: height,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.colorTextWhite,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppDimens.defaultPadding),
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: AppDimens.paddingSize5,
                width: AppDimens.iconLarge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.defaultPadding)),
                  color: AppColors.colorComment,
                ),
              ).paddingSymmetric(vertical: AppDimens.paddingSize10),
            ),
            noHeader
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      actionArrowBack ??
                          const BackButton(
                            color: Colors.grey,
                          ),
                      Expanded(
                        child: Text(
                          title.tr,
                          textAlign: textAlign ?? TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: AppDimens.sizeTextMedium,
                          ),
                        ),
                      ),
                      iconTitle ??
                          const SizedBox(
                            width: 48, //size of Back Button
                          ),
                    ],
                  ),
            body,
          ],
        ).paddingSymmetric(horizontal: padding ?? AppDimens.defaultPadding),
      ),
    );
  }
}
