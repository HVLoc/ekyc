import 'package:ekyc/values/values.src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class BaseLoadingGetx extends GetxController {
  RxBool isShowLoading = false.obs;

  /// Sử dụng một số màn bắt buộc sử dụng loading overlay
  RxBool isLoadingOverlay = false.obs;

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
  }

  void showLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hideLoadingOverlay() {
    isLoadingOverlay.value = false;
  }

  Widget buildLoadingOverlay(WidgetCallback child, {Color? colorIcon}) {
    return Obx(
      () => LoadingOverlayPro(
        progressIndicator: const CupertinoActivityIndicator(
          color: Colors.white,
        ),
        isLoading: isShowLoading.value,
        child: child(),
      ),
    );
  }

  Future<void> showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Widget? mainButton,
    Color backgroundColor = AppColors.colorLightAccent,
  }) async {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: backgroundColor,
      messageText: Text(
        message.tr,
        style: Get.textTheme.bodyMedium,
      ),
      message: message.tr,
      mainButton: Row(
        children: [
          if (mainButton != null) mainButton,
          IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.close)),
        ],
      ),
      duration: message.length > 100 ? 5.seconds : duration,
    ));
  }
}
