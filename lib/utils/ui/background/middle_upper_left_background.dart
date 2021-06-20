import 'package:flutter/material.dart';
import 'package:hris_mobile/utils/ui/painter/middle_left_painter.dart';
import 'package:kartal/kartal.dart';
import 'package:supercharged/supercharged.dart';

class MiddleUpperLeftBackground extends StatelessWidget {
  const MiddleUpperLeftBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      left: 20,
      bottom: 10,
      child: Align(
        alignment: Alignment.centerLeft,
        child: CustomPaint(
          size: Size(
            context.width,
            (context.width * 0.3).toDouble(),
          ),
          painter: MiddleLeftPainter(color: '#E8F2FF'.toColor()),
        ),
      ),
    );
  }
}
