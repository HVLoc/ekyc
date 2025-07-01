part of 'nfc_kyc_page.dart';

Widget _body(ScanNfcKycController controller) {
  return Container(
    height: Get.height,
    width: Get.width,
    color: AppColors.white,
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const TextUtils(
                //   text: "Thông tin cá nhân",
                //   availableStyle: StyleEnum.bodyMedium,
                //   color: AppColors.black26,
                // ),
                // SvgPicture.asset(
                //   Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_NFC_SVG,
                // // ),
                // UtilWidget.sizedBox7,
                Column(
                  children: [
                    UtilWidget.buildInputData(
                      title: LocaleKeys.nfcInfo_name.tr,
                      textEditingController: controller.userNameController,
                      isReadOnly: true,
                      hintText: LocaleKeys.nfcInfo_name.tr,
                      errorValidator: "",
                      currentNode: controller.userNameFocus.value,
                      visible: controller.userNameController.text != "",
                    ),
                    UtilWidget.buildInputData(
                      title: LocaleKeys.nfcInfo_number.tr,
                      textEditingController: controller.idDocumentController,
                      isReadOnly: true,
                      hintText: LocaleKeys.nfcInfo_number.tr,
                      errorValidator: "",
                      currentNode: controller.idDocumentFocus.value,
                    ),
                    UtilWidget.buildInputData(
                        title: LocaleKeys.nfcInfo_dob.tr,
                        textEditingController: controller.dobController,
                        isReadOnly: true,
                        hintText: LocaleKeys.nfcInfo_dob.tr,
                        errorValidator: "",
                        currentNode: controller.dobFocus.value,
                        visible: controller.dobController.text != ""),
                    UtilWidget.buildInputData(
                        title: LocaleKeys.nfcInfo_doe.tr,
                        textEditingController: controller.doeController,
                        isReadOnly: true,
                        hintText: LocaleKeys.nfcInfo_doe.tr,
                        errorValidator: "",
                        currentNode: controller.doeFocus.value,
                        visible: controller.doeController.text != ""),
                    // UtilWidget.buildInputData(
                    //   title: NfcInformationString.firstName,
                    //   textEditingController: controller.userNameController,
                    //   isReadOnly: true,
                    //   hintText: "",
                    //   errorValidator: "",
                    //   currentNode: controller.userNameFocus.value,
                    //   nextMode: controller.dobFocus.value,
                    //   // iconLeading: Icons.person,
                    // ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: TextUtils(
                        text: LocaleKeys.nfcInfo_content.tr,
                        availableStyle: StyleEnum.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UtilWidget.sizedBox10,
                    TextUtils(
                      text: LocaleKeys.nfcInfo_content1.tr,
                      availableStyle: StyleEnum.bodySmall,
                      color: AppColors.colorNeutral2,
                      maxLine: 3,
                    ),
                    UtilWidget.sizedBox5,
                    TextUtils(
                      text: LocaleKeys.nfcInfo_content2.tr,
                      availableStyle: StyleEnum.bodySmall,
                      color: AppColors.colorNeutral2,
                      maxLine: 3,
                    ),
                    UtilWidget.sizedBox5,
                    TextUtils(
                      text: LocaleKeys.nfcInfo_content3.tr,
                      availableStyle: StyleEnum.bodySmall,
                      color: AppColors.colorNeutral2,
                      maxLine: 3,
                    ),
                  ],
                ).paddingSymmetric(vertical: AppDimens.defaultPadding)
              ],
            ).paddingAll(AppDimens.iconVerySmall),
          ),
        ),
        _buildButtonNfcContinue(controller),
      ],
    ),
  );
}

Widget _buildButtonNfcContinue(ScanNfcKycController controller) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Obx(
        () => UtilWidget.buildButton(
          LocaleKeys.nfcInfo_action.tr,
          () async => await controller.scanNfc(),
          isLoading: controller.isShowLoading.value,
          backgroundColor: AppColors.colorlueX,
        ),
      ),
      UtilWidget.sizedBox7,

      // ButtonUtils.buildButton("Quét CHIP với NFC", () async {
      //   await controller.scanNfc();
      // },
      //         isLoading: controller.isShowLoading.value,
      //         backgroundColor: AppColors.primaryBlue1,
      //         width: 180,
      //         // height: 50,
      //         colorText: AppColors.basicWhite)
      //     .paddingAll(AppDimens.padding15),
    ],
  ).paddingAll(AppDimens.paddingSmall);
}
