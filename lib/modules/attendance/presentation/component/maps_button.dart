// Flutter imports:
import 'package:flutter/material.dart';

class MapsButton extends StatelessWidget {
  const MapsButton({
    required this.onPressed,
    required this.icon,
  });

  final Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.white,
      elevation: 5,
      constraints: const BoxConstraints(minWidth: 45.0, minHeight: 45.0),
      child: icon,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
