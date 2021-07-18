// Dart imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:kartal/kartal.dart';
import 'package:supercharged/supercharged.dart';

// Project imports:
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_list_layout.dart';

class AttendanceListHeader extends StatelessWidget {
  const AttendanceListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w800,
    );
    return AttendanceListLayout(
      backgroundColor: '#FAF9FA'.toColor(),
      height: context.height * 0.045,
      startAlignmentSpacing: context.width * 0.11,
      startAlignmentWidget: [
        const Text('Date', style: textStyle),
        const Text('Check In', style: textStyle),
        const Text('Check Out', style: textStyle),
      ],
      endAlignmentWidget: [
        const Text('Working Hr\'s', style: textStyle),
        const SizedBox(width: 12)
      ],
    );
  }
}
