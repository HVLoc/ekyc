import 'package:ekyc/assets.dart';
import 'package:ekyc/base/base.src.dart';
import 'package:ekyc/values/values.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetCheckNfc extends StatelessWidget {
  final bool isSupportNfc;

  const BottomSheetCheckNfc(this.isSupportNfc, {super.key});

  String getTitle() {
    return isSupportNfc
        ? LocaleKeys.nfcDialog_titleInstallationGuide
        : LocaleKeys.nfcDialog_titleNotAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextUtils(
          text: getTitle(),
          availableStyle: StyleEnum.bodyMedium,
          color: AppColors.colorBlueX,
        ),
        const SizedBox(
          height: AppDimens.paddingSize15,
        ),
        const SizedBox(
          height: AppDimens.paddingSize15,
        ),
        SvgPicture.asset(
            isSupportNfc
                ? Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_NO_SUPPORT_NFC_SVG
                : Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_NO_SUPPORT_NFC_SVG,
            colorFilter:
                const ColorFilter.mode(AppColors.colorBlueX, BlendMode.srcIn)),
        const SizedBox(
          height: AppDimens.paddingSize15,
        ),
        Visibility(
          visible: isSupportNfc,
          child: _buildInstallationGuide(),
        ),
        Visibility(
          visible: !isSupportNfc,
          child: _buildContactSupport(),
        ),
        const SizedBox(
          height: AppDimens.paddingSize15,
        ),
        isSupportNfc
            ? UtilWidget.buildButton(
                LocaleKeys.nfcDialog_setting,
                () {
                  AppSettings.openAppSettings(type: AppSettingsType.nfc);
                },
                backgroundColor: AppColors.colorBlueX,
              ).paddingSymmetric(vertical: AppDimens.paddingSize5)
            : _buildBottomContactSupport()
      ],
    );
  }

  Widget _buildInstallationGuide() {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.nfcDialog_contentInstallationGuideOne,
        style: FontStyleUtils.fontStyleSans(color: Colors.black),
        children: const [
          TextSpan(
            text: LocaleKeys.nfcDialog_contentInstallationGuideTwo,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: LocaleKeys.nfcDialog_contentInstallationGuideThree),
          TextSpan(
            text: LocaleKeys.nfcDialog_contentInstallationGuideFour,
          ),
          TextSpan(
            text: LocaleKeys.nfcDialog_contentInstallationGuideFive,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBottomContactSupport() {
    return UtilWidget.buildButton(
      LocaleKeys.nfcDialog_contact,
      () async {
        // await UtilWidget.launchInBrowser(LocaleKeys.nfcDialog_check_nfc_number_hotline)
        //     .then((value) {
        //   if (Get.isBottomSheetOpen ?? false) {
        //     Get.back();
        //   }
        // });
      },
      backgroundColor: AppColors.colorTextWhite,
      colorText: AppColors.colorBlueX,
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildContactSupport() {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.nfcDialog_titleNotAvailable,
        style: FontStyleUtils.fontStyleSans(color: Colors.black),
        children: const [
          // TextSpan(text: LocaleKeys.nfcDialog_check_nfc_please_contact),
          // TextSpan(
          //   text: LocaleKeys.nfcDialog_check_nfc_hotline,
          //   style: FontStyleUtils.fontStyleSans(
          //     color: AppColors.primaryBlue1,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // TextSpan(
          //   text: LocaleKeys.nfcDialog_check_nfc_number_hotline,
          //   style: FontStyleUtils.fontStyleSans(
          //     color: AppColors.primaryBlue1,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // TextSpan(text: LocaleKeys.nfcDialog_check_nfc_support),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
