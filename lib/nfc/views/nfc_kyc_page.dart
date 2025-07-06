import 'package:ekyc/nfc/nfc.src.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/values.src.dart';

part 'nfc_kyc_view.dart';

class ScanNfcKycPage extends GetView<ScanNfcKycController> {
  const ScanNfcKycPage({super.key});

  @override
  ScanNfcKycController get controller => Get.put(ScanNfcKycController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.nfcInfo_appbar.tr),
      ),
      body: _body(controller),
    );
  }
}
