import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hris_mobile/utils/extension/extension.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({
    Key? key,
    this.textStyle = const TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      letterSpacing: -1,
    ),
  }) : super(key: key);

  final TextStyle textStyle;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String? _time;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _time = DateTime.now().toStringAsTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    _time = DateTime.now().toStringAsTime;
    return Text(
      '$_time',
      textAlign: TextAlign.center,
      style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
