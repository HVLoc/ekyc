import 'package:ekyc/assets.dart';
import 'package:ekyc/values/values.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'nfc_dialog.src.dart';

class NfcDialog extends GetView<NfcDialogController> {
  @override
  NfcDialogController get controller => Get.put(NfcDialogController());

  const NfcDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: TextUtils(
                text: controller.isReading.value
                    ? LocaleKeys.nfcDialog_nfcWaitingTitle.tr
                    : LocaleKeys.nfcDialog_dialogTitle.tr,
                availableStyle: StyleEnum.bodyLarge,
                color: AppColors.lightPrimaryColor,
              ).paddingOnly(
                  top: AppDimens.paddingMedium, bottom: AppDimens.paddingSmall),
            ),
            SvgPicture.asset(
              Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_SCAN_NFC_SVG,
            ),
            TextUtils(
              text: controller.isReading.value
                  ? LocaleKeys.nfcDialog_nfcWaiting.tr
                  : LocaleKeys.nfcDialog_dialogContent.tr,
              availableStyle: StyleEnum.bodyMedium,
              color: Colors.black,
              maxLine: 3,
              textAlign: TextAlign.center,
            ).paddingAll(AppDimens.paddingSize5),
            buildProgressBar(controller),
            UtilWidget.buildButton(
              LocaleKeys.nfcDialog_dialogCancel.tr,
              () async {
                Get.back();
                await controller.nfc.disconnect();
                controller.isReading.value = false;
              },
              // isLoading: controller.isShowLoading.value,
              backgroundColor: AppColors.colorTextWhite,
              border:
                  const BorderSide(color: AppColors.lightPrimaryColor, width: 1),
              colorText: AppColors.lightPrimaryColor,
            ).paddingAll(AppDimens.paddingMedium)
          ],
        ).paddingOnly(bottom: AppDimens.paddingSmall));
  }

  Widget buildProgressBar(NfcDialogController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: controller.isReading.value,
          child: LinearPercentIndicator(
            width: Get.width / 1.8,
            lineHeight: 8,
            alignment: MainAxisAlignment.center,
            percent: controller.processQuantity.value / controller.maxProcess,
            progressColor: AppColors.colorBlueX,
            barRadius: const Radius.circular(AppDimens.paddingSmallest),
          ).paddingOnly(
              top: AppDimens.paddingSmallest,
              bottom: AppDimens.paddingSmallest),
        ),
        const SizedBox(height: 10),
        Visibility(
          visible: controller.processQuantity.value > 0,
          child: TextUtils(
            text: "${controller.processQuantity.value * 10}%",
            availableStyle: StyleEnum.titleSmall,
            color: AppColors.lightPrimaryColor,
            maxLine: 1,
            textAlign: TextAlign.center,
          ).paddingOnly(bottom: AppDimens.paddingSmallest),
        ),
      ],
    );
  }
}
