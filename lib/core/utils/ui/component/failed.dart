// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class Failed extends StatelessWidget {
  const Failed({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animation/lonely-404.json',
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              'Opps, ${message.toLowerCase()}',
              textAlign: TextAlign.center,
              style: context.textTheme.headline4,
            ),
          ),
          context.emptySizedHeightBoxHigh
        ],
      ),
    );
  }
}
