part of 'live_ness_kyc_page.dart';

Widget _body(LiveNessKycController controller) {
  return _buildCapturePage(controller);
}

Widget _buildCapturePage(LiveNessKycController controller) {
  return Stack(
    children: [
      controller.cameraIsInitialize.value
          ? Positioned.fill(
              child: Transform.scale(
                scale: 1.2,
                child: Center(
                  child: CameraPreview(controller.cameraController),
                ),
              ),
            )
          : const SizedBox(),
      SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(fit: StackFit.passthrough, children: [
          CustomPaint(
            painter: CustomShapePainterLiveNess(),
          ),
          // Positioned(
          //     top: Get.size.height / 2.2 - (Get.width / 2 - 25),
          //     left: Get.width / 2 - (Get.width / 2 - 25),
          //     child: _circularPercentIndicator(controller)),
          // _buttonTakePicture(controller),
          _buttonStart(controller),
          _actionWidget(controller),
          // _positionedAppbar(controller),
          _warningFace(controller),
          Positioned(
            left: AppDimens.iconVerySmall,
            right: AppDimens.iconVerySmall,
            bottom: Get.height / 2.2 - Get.width / 2 - 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: LocaleKeys.live_ness_Step.tr,
                  availableStyle: StyleEnum.bodySmall,
                  color: AppColors.colorSemantic3,
                  textAlign: TextAlign.center,
                ),
                _itemRow(LocaleKeys.live_ness_Step1.tr),
                _itemRow(LocaleKeys.live_ness_Step2.tr),
              ],
            ),
          )
          // if (controller.imageTemp.value != null)
          //   _buildWidgetHaveImage(controller),
        ]),
      ),
    ],
  );
}

Row _itemRow(String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const TextUtils(
        text: "•   ",
        availableStyle: StyleEnum.bodySmall,
        color: AppColors.colorNeutral2,
      ),
      Expanded(
        child: TextUtils(
          text: title,
          availableStyle: StyleEnum.bodySmall,
          color: AppColors.colorNeutral2,
          maxLine: 4,
        ),
      ),
    ],
  );
}

Stack _warningFace(LiveNessKycController controller) {
  return Stack(
    children: [
      Visibility(
        visible:
            controller.isFaceEmpty.value && !controller.isSuccessLiveNess.value,
        child: Positioned(
          left: AppDimens.defaultPadding,
          right: AppDimens.defaultPadding,
          top: Get.height / 2 + AppDimens.sizeBorderNavi,
          child: Container(
            color: Colors.grey.withOpacity(0.35),
            child: TextUtils(
              text: LocaleKeys.live_ness_liveNessEmptyFace.tr,
              availableStyle: StyleEnum.bodySmall,
              color: Colors.white,
              maxLine: 2,
              textAlign: TextAlign.center,
            ).paddingAll(8),
          ),
        ),
      ),
      Visibility(
        visible:
            controller.isManyFace.value && !controller.isSuccessLiveNess.value,
        child: Positioned(
          left: AppDimens.defaultPadding,
          right: AppDimens.defaultPadding,
          top: Get.height / 2 + AppDimens.sizeBorderNavi,
          child: Container(
            color: Colors.grey.withOpacity(0.35),
            child: TextUtils(
              text: LocaleKeys.live_ness_liveNessManyFace.tr,
              availableStyle: StyleEnum.bodySmall,
              color: Colors.white,
              maxLine: 2,
              textAlign: TextAlign.center,
            ).paddingAll(8),
          ),
        ),
      ),
    ],
  );
}

Visibility _actionWidget(LiveNessKycController controller) {
  return Visibility(
    visible: controller.isSuccessLiveNess.isFalse,
    child: Positioned(
      left: AppDimens.sizeTextSmallest,
      right: AppDimens.sizeTextSmallest,
      top: Get.height / 8,
      child: controller.currentStep.value > 0
          ? Column(
              children: [
                TextUtils(
                  text: LocaleKeys.live_ness_titleAction.tr,
                  availableStyle: StyleEnum.titleMedium,
                  color: AppColors.colorNeutral1,
                  maxLine: 2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextUtils(
                  text: (controller.currentStep.value - 1) > 4
                      ? ""
                      : controller
                          .questionTemp[controller.currentStep.value - 1],
                  availableStyle: StyleEnum.bodyMedium,
                  color: const Color(0xFF3DA000),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Column(
              children: [
                TextUtils(
                  text: LocaleKeys.live_ness_titleAction.tr,
                  availableStyle: StyleEnum.titleMedium,
                  color: AppColors.colorNeutral1,
                  maxLine: 2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextUtils(
                  text: LocaleKeys.live_ness_titleSchedule.tr,
                  availableStyle: StyleEnum.bodyMedium,
                  color: AppColors.colorNeutral2,
                  maxLine: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    ),
  );
}

Visibility _buttonStart(LiveNessKycController controller) {
  return Visibility(
    visible: controller.currentStep.value == 0,
    child: Positioned(
      left: AppDimens.defaultPadding,
      right: AppDimens.defaultPadding,
      bottom: AppDimens.defaultPadding,
      child: ElevatedButton(
          onPressed: () async {
            await controller.startStreamPicture();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.colorBlueX,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            LocaleKeys.live_ness_action,
            style: TextStyle(
              fontSize: AppDimens.sizeTextMediumTb,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          )),
    ),
  );
}

// Positioned _positionedAppbar(LiveNessKycController controller) {
//   return Positioned(
//     left: 0,
//     right: AppDimens.sizeTextSmallest,
//     top: 0,
//     child: Align(
//       alignment: Alignment.topCenter,
//       child: UtilWidget.buildAppBar(
//         LocaleKeys.nfcResult_appbar.tr,
//         isColorGradient: false,
//         leading: true,
//         // funcLeading: () async {
//         //   if(controller.appController.openAppToDeepLink){
//         //     Get.offAllNamed(
//         //       AppRoutes.routeHome,
//         //     );
//         //   }else{
//         //     Get.back();
//         //   }
//         //   // await controller.closePros();
//         // },
//         // backButtonColor: AppColors.colorWhite,
//         // textColor: AppColors.colorWhite,
//         // availableStyle: StyleEnum.bodyRegular,
//         backgroundColor: AppColors.colorTransparent,
//         statusBarIconBrightness: true,
//         // iconSize:
//       ),
//     ),
//   );
// }
