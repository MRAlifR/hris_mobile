// Flutter imports:
import 'package:flutter/material.dart';

class CardSeparator extends StatelessWidget {
  CardSeparator({
    this.firstLineWidth = 30,
    this.secondLineWidth = 40,
    this.visible = true,
  });

  final double firstLineWidth;
  final double secondLineWidth;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 3.0,
            width: firstLineWidth,
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Container(
            height: 3.0,
            width: secondLineWidth,
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
