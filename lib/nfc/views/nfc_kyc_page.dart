import 'package:e_contract/base_utils/base_src.dart';
import 'package:e_contract/cores/cores_src.dart';
import 'package:e_contract/generated/locales.g.dart';
import 'package:e_contract/modules/nfc_kyc/nfc/nfc.src.dart';
import 'package:e_contract/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'nfc_kyc_view.dart';

class ScanNfcKycPage extends BaseGetWidget<ScanNfcKycController> {
  const ScanNfcKycPage({Key? key}) : super(key: key);

  @override
  ScanNfcKycController get controller => Get.put(ScanNfcKycController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.nfcInfo_appbar.tr,
        isColorGradient: false,
        backgroundColor: AppColors.colorWhite,
        leading: true,
      ),
      body: _body(controller),
    );
  }
}
