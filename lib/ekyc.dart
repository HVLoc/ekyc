import 'package:ekyc/live_ness/live_ness_kyc.src.dart';
import 'package:get/get.dart';

class Ekyc {
  Future<String?> gotoLiveNess() async {
    final resultImg = await Get.to(const LiveNessKycPage());
    return resultImg?.toString();
  }
}
