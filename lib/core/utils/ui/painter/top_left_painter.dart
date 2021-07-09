// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

class TopLeftPainter extends CustomPainter {
  TopLeftPainter({required this.colorGradient});

  final List<Color> colorGradient;

  @override
  void paint(Canvas canvas, Size size) {
    var paint_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    // ignore: cascade_invocations
    paint_0.shader = ui.Gradient.linear(
      Offset(0, size.height),
      Offset(size.width * 0.65, 0),
      colorGradient,
      [
        0.00,
        0.52,
        1.00,
      ],
    );

    var path_0 = Path()
      ..moveTo(0, size.height)
      ..cubicTo(
          size.width * 0.0478700,
          size.height * 0.9978444,
          size.width * 0.0650100,
          size.height * 0.8736444,
          size.width * 0.0687800,
          size.height * 0.8224000)
      ..cubicTo(
          size.width * 0.0754200,
          size.height * 0.6503111,
          size.width * 0.0978800,
          size.height * 0.5159333,
          size.width * 0.1081300,
          size.height * 0.4651556)
      ..cubicTo(
          size.width * 0.1547100,
          size.height * 0.3014000,
          size.width * 0.2484600,
          size.height * 0.2709111,
          size.width * 0.2696600,
          size.height * 0.2670000)
      ..cubicTo(
          size.width * 0.3101000,
          size.height * 0.2526667,
          size.width * 0.4712100,
          size.height * 0.2734667,
          size.width * 0.4995600,
          size.height * 0.2525778)
      ..cubicTo(
          size.width * 0.5820300,
          size.height * 0.2025778,
          size.width * 0.6369300,
          size.height * 0.1247333,
          size.width * 0.6500000,
          0)
      ..quadraticBezierTo(size.width * 0.4875000, 0, 0, 0)
      ..quadraticBezierTo(0, size.height * 0.2500000, 0, size.height)
      ..close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
