// Flutter imports:
import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon, {
    required this.size,
    required this.colorList,
  });

  final IconData icon;
  final double size;
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final rect = Rect.fromLTRB(0, 0, size, size);
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [-0.1, 0.4, 1.1],
          colors: colorList,
        ).createShader(rect);
      },
    );
  }
}
