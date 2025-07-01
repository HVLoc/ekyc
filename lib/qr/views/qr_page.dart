import 'package:ekyc/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../values/values.src.dart';
import '../qr.src.dart';

part 'qr_view.dart';

class QRGuidePage extends GetView<QRController> {
  const QRGuidePage({super.key});

  @override
  QRController get controller => Get.put(QRController());

  // @override
  // Widget buildWidgets() {
  //   return _buildBody();
  // }

  @override
  Widget build(BuildContext context) {
    return controller.buildLoadingOverlay(() => _buildBody(controller));
  }
}

class CustomShapePainterDaily extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Vẽ các khối màu vào canvas
    size = Get.size;
    Paint paint = Paint();
    final centerX = size.width / 2; // Tính toán tọa độ x của trung tâm
    final centerY = size.height / 3.8; // Tính toán tọa độ y của trung tâm
    final width = size.width - 50; // Chiều rộng của hình vuông
    final height = size.height / 3; // Chiều cao của hình vuông

    Path clipPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height));
    clipPath.fillType = PathFillType.evenOdd;

    canvas.clipPath(clipPath);

    // Vẽ các khối màu đã được cắt bỏ

    // Vẽ khối màu 1
    paint.color = AppColors.colorGreyOpacity35;
    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width * 0.5, size.height * 0.5), paint);

    // Vẽ khối màu 2
    // paint.color = Colors.white.withOpacity(0.5);
    canvas.drawRect(
        Rect.fromLTRB(size.width * 0.5, 0, size.width, size.height * 0.5),
        paint);

    // Vẽ khối màu 3
    // paint.color = Colors.white.withOpacity(0.5);
    canvas.drawRect(
        Rect.fromLTRB(0, size.height * 0.5, size.width * 0.5, size.height),
        paint);

    // Vẽ khối màu 4
    // paint.color = Colors.white.withOpacity(0.5);
    canvas.drawRect(
        Rect.fromLTRB(
            size.width * 0.5, size.height * 0.5, size.width, size.height),
        paint);

    // Vẽ viền đứt xung quanh hình vuông
    Path borderPath = Path();
    borderPath.addRect(
      Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height),
    );
    // final borderPaint = Paint()
    //   ..color = Colors.amber // Màu của viền
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 4.0; // Độ rộng của viền
    // const dashWidth = 15.0; // Độ rộng của mỗi đoạn trong viền đứt
    // const dashSpace = 10.0; // Khoảng cách giữa các đoạn trong viền đứt

    final path = Path();
    path.addRect(
      Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height),
    );

    // Vẽ viền đứt
    // drawDashedPath(canvas, path, borderPaint, dashWidth, dashSpace);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

/*  void drawDashedPath(Canvas canvas, Path path, Paint paint, double dashWidth,
      double dashSpace) {
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double start = 0.0;
      while (start < metric.length) {
        final end = start + dashWidth;
        canvas.drawPath(
          metric.extractPath(start, end),
          paint,
        );
        start = end + dashSpace;
      }
    }
  }*/
}
