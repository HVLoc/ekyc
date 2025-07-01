import 'package:camera/camera.dart';
import 'package:ekyc/live_ness/live_ness_kyc.src.dart';
import 'package:ekyc/values/values.src.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'live_ness_kyc_view.dart';

class LiveNessKycPage extends GetView<LiveNessKycController> {
  const LiveNessKycPage({super.key});

  @override
  LiveNessKycController get controller => Get.put(LiveNessKycController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.buildLoadingOverlay(
        () => _body(controller),
      ),
    );
  }
}
