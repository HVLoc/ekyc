import 'package:ekyc/nfc/nfc.src.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base.src.dart';
import '../../nfc_dialog/nfc_dialog.src.dart';
import '../../values/const.dart';
import '../../values/values.src.dart';

class ScanNfcKycController extends BaseLoadingGetx with WidgetsBindingObserver {
  final RxBool maybeContinue = false.obs;
  final idDocumentController = TextEditingController();
  final userNameController = TextEditingController();
  final dobController = TextEditingController();
  final doeController = TextEditingController();
  final Rx<FocusNode> idDocumentFocus = FocusNode().obs;
  final Rx<FocusNode> userNameFocus = FocusNode().obs;
  final Rx<FocusNode> dobFocus = FocusNode().obs;
  final Rx<FocusNode> doeFocus = FocusNode().obs;
  String statusNFC = "";

  final formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    if (Get.arguments is String) {
      idDocumentController.text = Get.arguments as String;
    }

    statusNFC = await CheckSupportNfc.checkNfcAvailability();

    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      statusNFC = await CheckSupportNfc.checkNfcAvailability();
      if (Get.currentRoute == "/ScanNfcKycPage") {
        if (statusNFC == AppConst.nfcAvailable) {
          if (Get.isBottomSheetOpen ?? false) {
            Get.back();
            showSnackBar(LocaleKeys.nfcDialog_nfcOpen.tr);
          }
        }
      }
    }
  }

  Future<void> scanNfc() async {
    // ShowDialog.funcOpenBottomSheet(const NfcDialog());
    if (statusNFC == AppConst.nfcAvailable) {
      if (GetPlatform.isIOS) {
        NfcDialogController nfcDialogController =
            Get.put(NfcDialogController());
        await nfcDialogController.scanNFC();
      } else if (GetPlatform.isAndroid) {
        Get.bottomSheet(const NfcDialog());
      }
    } else if (statusNFC == AppConst.nfcDisabled) {
      showNfcBottomSheet(true);
    } else if (statusNFC == AppConst.nfcDisabledNotSupported) {
      showNfcBottomSheet(false);
    }
  }

  void showNfcBottomSheet(bool isSupportNfc) {
    Get.bottomSheet(
      BaseBottomSheet.build(
        title: "",
        body: BottomSheetCheckNfc(isSupportNfc),
        noHeader: true,
      ),
      isScrollControlled: true,
    );
  }
}
