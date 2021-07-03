import 'package:flutter/material.dart';
import 'package:hris_mobile/core/utils/ui/painter/painter.dart';
import 'package:kartal/kartal.dart';
import 'package:supercharged/supercharged.dart';

class TopLeftBackground extends StatelessWidget {
  const TopLeftBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 0,
      left: 0,
      child: Align(
        alignment: Alignment.topLeft,
        child: CustomPaint(
          size: Size(
            context.width,
            (context.width * 0.45).toDouble(),
          ),
          painter: TopLeftPainter(
            colorGradient: [
              '#E8E4FF'.toColor(),
              '#E7E7FE'.toColor(),
              '#E6F1FF'.toColor(),
            ],
          ),
        ),
      ),
    );
  }
}
