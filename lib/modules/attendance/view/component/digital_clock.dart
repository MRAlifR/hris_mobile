import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hris_mobile/utils/extension/extension.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({
    Key? key,
  }) : super(key: key);

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String? _time;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _time = DateTime.now().timeToString);
    });
  }

  @override
  Widget build(BuildContext context) {
    _time = DateTime.now().timeToString;
    return Text(
      '$_time',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
      ),
    );
  }
}
