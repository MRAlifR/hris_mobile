// Flutter imports:
import 'package:flutter/material.dart';

class MiddleLeftPainter extends CustomPainter {
  MiddleLeftPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint_0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    var path_0 = Path()
      ..moveTo(size.width * 0.0781176, size.height * 0.7400000)
      ..cubicTo(
          size.width * 0.0692941,
          size.height * 0.7674000,
          size.width * 0.0705294,
          size.height * 0.8072000,
          size.width * 0.0750588,
          size.height * 0.8264000)
      ..cubicTo(
          size.width * 0.0823529,
          size.height * 0.8528000,
          size.width * 0.0955294,
          size.height * 0.8504000,
          size.width * 0.1028235,
          size.height * 0.8312000)
      ..cubicTo(
          size.width * 0.1110588,
          size.height * 0.8092000,
          size.width * 0.1085294,
          size.height * 0.7740000,
          size.width * 0.1049412,
          size.height * 0.7472000)
      ..cubicTo(
          size.width * 0.1013529,
          size.height * 0.7220000,
          size.width * 0.0881176,
          size.height * 0.7094000,
          size.width * 0.0781176,
          size.height * 0.7400000)
      ..close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
