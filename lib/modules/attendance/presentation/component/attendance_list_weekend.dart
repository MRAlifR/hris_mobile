// Dart imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:kartal/kartal.dart';
import 'package:supercharged/supercharged.dart';

class AttendanceListWeekend extends StatelessWidget {
  const AttendanceListWeekend({
    Key? key,
    this.saturdayDate,
    this.sundayDate,
  }) : super(key: key);

  final String? saturdayDate;
  final String? sundayDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 18,
        left: 18,
        right: 18,
      ),
      child: Container(
        color: '#FBFBF0'.toColor(),
        // color: Colors.amber.shade100,
        height: context.height * 0.07,
        child: Center(
          child: Text(
            'Weekend : $saturdayDate Saturday & $sundayDate Sunday',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
