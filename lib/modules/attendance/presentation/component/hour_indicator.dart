// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:kartal/kartal.dart';

class HourIndicator extends StatelessWidget {
  HourIndicator({
    Key? key,
    required this.icon,
    required this.time,
    required this.subtitle,
  }) : super(key: key);

  late final Widget icon;
  late final String time;
  late final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          icon,
          context.emptySizedHeightBoxLow,
          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
