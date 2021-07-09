// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:kartal/kartal.dart';
import 'package:supercharged/supercharged.dart';

// Project imports:
import 'package:hris_mobile/core/utils/ui/painter/painter.dart';

class MiddleRightBackground extends StatelessWidget {
  const MiddleRightBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      right: 0,
      bottom: 120,
      child: Align(
        alignment: Alignment.bottomRight,
        child: CustomPaint(
          size: Size(
            context.width,
            (context.width * 0.3).toDouble(),
          ),
          painter: MiddleRightPainter(color: '#E8F2FF'.toColor()),
        ),
      ),
    );
  }
}
