import 'dart:async';
import 'package:hris_mobile/modules/attendance/view/component/round_button.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class AttendanceScreen extends StatefulWidget {
  static const id = 'attendance_screen';

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isCheckIn = true;

  @override
  Widget build(BuildContext context) {
    var checkInButton = RoundButton(
      title: 'CLOCK IN',
      onTap: () {
        setState(() {
          isCheckIn = !isCheckIn;
        });
      },
      colorList: [
        '#3E80DD'.toColor(),
        '#6672D6'.toColor(),
        '#9A87E4'.toColor(),
      ],
    );

    var checkOutButton = RoundButton(
      title: 'CLOCK OUT',
      onTap: () {
        setState(() {
          isCheckIn = !isCheckIn;
        });
      },
      colorList: [
        '#8E3098'.toColor(),
        '#C8307D'.toColor(),
        '#F04980'.toColor(),
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            top: 100,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'ABHIPERS',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '09:12',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1,
                    ),
                  ),
                  const Text(
                    'Wednesday, Dec 12',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -1,
                    ),
                  ),
                  isCheckIn ? checkInButton : checkOutButton,
                  context.emptySizedHeightBoxLow,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const Text(
                        'Location: Central Building Office',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
