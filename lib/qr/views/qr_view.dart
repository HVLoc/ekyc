part of 'qr_page.dart';

Widget _buildBody(QRController controller) {
  return Scaffold(
    // backgroundColor: AppColors.colorTextWhite,
    body: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.ASSETS_IMAGES_ICON_ICON_PNG_IMG_STOP_QR_PNG),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          MobileScanner(
            // fit: BoxFit.contain,
            controller: controller.cameraController,
            onDetect: (capture) async {
              final List<Barcode> barcodes = capture.barcodes;
              // final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  await controller.getData(barcode.rawValue ?? "");
                }
              }
            },
            // onScannerStarted: (_) {
            //   controller.cameraController
            //       .setZoomScale(controller.zoomX.value * 0.1);
            // },
          ),
          CustomPaint(
            painter: CustomShapePainterDaily(),
          ),
          _buildListGuild(),
          _buildListImage(controller),
          Positioned(
              top: Get.height / 3.8 - Get.height / 6,
              left: 25,
              child: Image.asset(
                Assets.ASSETS_IMAGES_ICON_ICON_PNG_ICON_CORNER_LEFT_DOWN_PNG,
                width: AppDimens.size45,
                height: AppDimens.size45,
                color: AppColors.colorTextWhite,
              )),
          Positioned(
              top: Get.height / 3.8 - Get.height / 6,
              right: 25,
              child: Image.asset(
                Assets.ASSETS_IMAGES_ICON_ICON_PNG_ICON_CORNER_RIGHT_DOWN_PNG,
                width: AppDimens.size45,
                height: AppDimens.size45,
                color: AppColors.colorTextWhite,
              )),
          Positioned(
              top: Get.height / 3.8 + Get.height / 6 - AppDimens.size45,
              left: 25,
              child: Image.asset(
                Assets.ASSETS_IMAGES_ICON_ICON_PNG_ICON_CORNER_LEFT_UP_PNG,
                width: AppDimens.size45,
                height: AppDimens.size45,
                color: AppColors.colorTextWhite,
              )),
          Positioned(
              top: Get.height / 3.8 + Get.height / 6 - AppDimens.size45,
              right: 25,
              child: Image.asset(
                Assets.ASSETS_IMAGES_ICON_ICON_PNG_ICON_CORNER_RIGHT_UP_PNG,
                width: AppDimens.size45,
                height: AppDimens.size45,
                color: AppColors.colorTextWhite,
              )),
        ],
      ),
    ),
  );
}

Widget _buildListGuild() {
  return Positioned(
    left: 10,
    right: 10,
    top: Get.height / 3.8 + Get.height / 6 + 80,
    child: Column(
      children: [
        _buildItemText(QRString.qrTitle1.tr),
        const SizedBox(height: AppDimens.paddingSize5),
        _buildItemText(QRString.qrTitle2.tr),
        const SizedBox(height: AppDimens.paddingSize5),
        _buildItemText(QRString.qrTitle3.tr),
        const SizedBox(height: AppDimens.paddingSize5),
        _buildItemText(QRString.qrTitle4.tr),
        const SizedBox(height: AppDimens.paddingSize5),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingSize5),
  );
}

Widget _buildItemText(String title) {
  return Row(
    children: [
      const TextUtils(
          text: "•   ",
          color: AppColors.colorTextWhite,
          availableStyle: StyleEnum.bodyMedium),
      Expanded(
        child: TextUtils(
            text: title,
            color: AppColors.colorTextWhite,
            availableStyle: StyleEnum.bodyMedium),
      ),
    ],
  );
}

Widget _buildListImage(QRController controller) {
  return Positioned(
    left: 20,
    right: 20,
    top: Get.height / 3.8 + Get.height / 6 + 10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          color: Colors.white,
          icon: ValueListenableBuilder<TorchState>(
            valueListenable: controller.torchState,
            builder: (context, state, child) {
              switch (state) {
                case TorchState.off:
                  return const Icon(Icons.flash_off,
                      color: AppColors.colorTextWhite);
                case TorchState.on:
                  return const Icon(Icons.flash_on, color: Colors.yellow);
                default:
                  return const Icon(
                      Icons.flash_off); // Default case to avoid returning null
              }
            },
          ),
          iconSize: 32.0,
          onPressed: () async {
            controller.toggleTorch();
            await Future.delayed(const Duration(milliseconds: 1500), () {
              controller.toggleTorch();
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SliderTheme(
              data: SliderThemeData(
                trackShape: CustomTrackShape(),
              ),
              child: SizedBox(
                width: Get.width / 2.5,
                child: Slider(
                  value: controller.zoomX.value,
                  max: 10,
                  divisions: 5,
                  label: "${controller.zoomX.value}X",
                  activeColor: AppColors.colorTextWhite,
                  inactiveColor: Colors.white30,
                  onChanged: (double value) {
                    controller.zoomX.value = value;
                    controller.cameraController.setZoomScale(value * 0.1);
                  },
                ),
              ),
            ).paddingOnly(right: 10),
            TextUtils(
              text: "${QRString.zoom.tr} ${controller.zoomX.value}X",
              color: AppColors.colorTextWhite,
              availableStyle: StyleEnum.bodyMedium,
              textAlign: TextAlign.left,
            )
          ],
        )
      ],
    ).paddingOnly(bottom: AppDimens.paddingSize5),
  );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
