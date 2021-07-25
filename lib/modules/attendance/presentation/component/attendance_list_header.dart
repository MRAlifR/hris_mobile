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
      padding: const EdgeInsets.only(left: 17.0),
      startAlignmentWidget: [
        const AttendanceListLayoutContainer(
          widthScale: 0.2,
          child: Text('Date', style: textStyle),
        ),
        const AttendanceListLayoutContainer(
          widthScale: 0.2,
          child: Text('Check In', style: textStyle),
        ),
        const AttendanceListLayoutContainer(
          widthScale: 0.2,
          child: Text('Check Out', style: textStyle),
        ),
      ],
      endAlignmentWidget: [
        const AttendanceListLayoutContainer(
          widthScale: 0.3,
          alignment: Alignment.centerRight,
          child: Text(
            'Working Hr\'s',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
        ),
        AttendanceListLayoutContainer(
          widthScale: 0.1,
          child: Container(),
        ),
      ],
    );
  }
}
