import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../base/base.src.dart';
import '../models/qr_model.src.dart';
import '../values/qr_strings.dart';

class QRController extends BaseLoadingGetx {
  String? barcodeController;
  String? idIdentity;
  String? information;
  String? informationIdCard;

  QrInformation qrInformation = QrInformation();
  late MobileScannerController cameraController;
  RxDouble zoomX = 6.0.obs;
  ValueNotifier<TorchState> torchState =
      ValueNotifier<TorchState>(TorchState.off);

  @override
  Future<void> onInit() async {
    showLoadingOverlay();

    cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      cameraResolution: const Size(1920, 1080),
      // torchEnabled: true,
    );
    Future.delayed(const Duration(seconds: 1), () {
      cameraController.setZoomScale(zoomX.value * 0.1);
    });
    hideLoadingOverlay();
    super.onInit();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    cameraController.dispose();
  }

  Future<void> getData(String barcodeScanRes) async {
    try {
      cameraController.stop();
      showLoadingOverlay();
      barcodeController = barcodeScanRes;
      idIdentity = barcodeController?.substring(0, 12);
      information = barcodeController?.substring(13);
      List<String> splitStrings = information?.split("|") ?? [];
      if (splitStrings.isNotEmpty) {
        DateTime? dateTimeDob = _convertDatetimeQr(splitStrings[2]);
        DateTime? dateTimeDor = _convertDatetimeQr(splitStrings[5]);
        if (dateTimeDob != null && dateTimeDor != null) {
          qrInformation.documentNumber = idIdentity;
          qrInformation.dateOfBirth =
              convertDateToString(dateTimeDob, pattern1);

          qrInformation.fullName = splitStrings[1];
          qrInformation.gender = splitStrings[3];
          qrInformation.address = splitStrings[4];
          qrInformation.informationIdCard = splitStrings[0];
        }

        Get.back(result: qrInformation);

        hideLoadingOverlay();
      }
    } catch (e) {
      showSnackBar(QRString.qrError.tr);
      cameraController.start();
      hideLoadingOverlay();
    }
  }

  void toggleTorch() {
    if (torchState.value == TorchState.off) {
      torchState.value = TorchState.on;
    } else {
      torchState.value = TorchState.off;
    }
  }

  DateTime? _convertDatetimeQr(String dateString) {
    if (dateString.length == 8) {
      int day = int.parse(dateString.substring(0, 2));
      int month = int.parse(dateString.substring(2, 4));
      int year = int.parse(dateString.substring(4, 8));

      return DateTime(year, month, day);
    }
    return null;
  }
}
