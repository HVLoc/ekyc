import 'package:camera/camera.dart';
import 'package:ekyc/live_ness/live_ness_kyc.src.dart';
import 'package:ekyc/values/values.src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

part 'live_ness_kyc_view.dart';

class LiveNessKycPage extends GetView<LiveNessKycController> {
  const LiveNessKycPage({super.key});

  @override
  LiveNessKycController get controller => Get.put(LiveNessKycController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLoadingOverlay(
        controller,
        () => _body(controller),
      ),
    );
  }
}
