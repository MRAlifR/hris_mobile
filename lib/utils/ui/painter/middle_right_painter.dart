import 'package:flutter/material.dart';

class MiddleRightPainter extends CustomPainter {
  MiddleRightPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint_0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    var path_0 = Path()
      ..moveTo(size.width * 1.0057386, size.height * 0.9116667)
      ..cubicTo(
          size.width * 0.9672273,
          size.height * 0.9064444,
          size.width * 0.9470000,
          size.height * 0.8686667,
          size.width * 0.9284091,
          size.height * 0.8340741)
      ..cubicTo(
          size.width * 0.8999432,
          size.height * 0.7818519,
          size.width * 0.8863750,
          size.height * 0.7066667,
          size.width * 0.8784091,
          size.height * 0.6529259)
      ..cubicTo(
          size.width * 0.8700682,
          size.height * 0.5714815,
          size.width * 0.8728182,
          size.height * 0.4965185,
          size.width * 0.8761364,
          size.height * 0.4481481)
      ..cubicTo(
          size.width * 0.8847273,
          size.height * 0.3514815,
          size.width * 0.9008295,
          size.height * 0.2890370,
          size.width * 0.9113636,
          size.height * 0.2444444)
      ..cubicTo(
          size.width * 0.9259886,
          size.height * 0.1896667,
          size.width * 0.9371023,
          size.height * 0.1645556,
          size.width * 0.9497841,
          size.height * 0.1372222)
      ..cubicTo(
          size.width * 0.9633636,
          size.height * 0.1065556,
          size.width * 0.9747614,
          size.height * 0.0895556,
          size.width * 0.9872614,
          size.height * 0.0722593)
      ..quadraticBezierTo(size.width * 0.9954432, size.height * 0.0567778,
          size.width * 1.0068182, size.height * 0.0518519)
      ..quadraticBezierTo(size.width * 1.0065483, size.height * 0.2668056,
          size.width * 1.0057386, size.height * 0.9116667)
      ..close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
