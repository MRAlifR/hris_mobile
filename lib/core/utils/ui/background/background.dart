// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:hris_mobile/core/utils/ui/background/middle_lower_left_background.dart';
import 'package:hris_mobile/core/utils/ui/background/middle_right_background.dart';
import 'package:hris_mobile/core/utils/ui/background/middle_upper_left_background.dart';
import 'package:hris_mobile/core/utils/ui/background/top_left_background.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TopLeftBackground(),
        const MiddleRightBackground(),
        const MiddleLowerLeftBackground(),
        const MiddleUpperLeftBackground(),
      ],
    );
  }
}
