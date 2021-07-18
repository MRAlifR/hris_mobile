// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:hris_mobile/constants/color.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: kPrimaryColor,
      primaryColor: kPrimaryColor,
      accentColor: kPrimaryAccentColor,
    );
  }
}
