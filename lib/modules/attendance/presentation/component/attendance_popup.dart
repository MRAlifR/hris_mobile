// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:kartal/kartal.dart';

// Project imports:
import 'package:hris_mobile/modules/attendance/presentation/component/digital_clock.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/gradient_icon.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/location_text.dart';

class AttendancePopup extends StatelessWidget {
  const AttendancePopup({
    Key? key,
    IconData icons = Icons.timer,
    required List<Color> iconColors,
    required String address,
  })  : _icons = icons,
        _iconColors = iconColors,
        _address = address,
        super(key: key);

  final IconData _icons;
  final List<Color> _iconColors;
  final String _address;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 15.0, 24.0, 32.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientIcon(
            _icons,
            size: 65,
            colorList: _iconColors,
          ),
          const Text(
            'time marked',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          const DigitalClock(
            textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          LocationText(address: _address),
        ],
      ),
    );
  }
}
