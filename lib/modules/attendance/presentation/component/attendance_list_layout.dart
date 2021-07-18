// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendanceListLayout extends StatelessWidget {
  const AttendanceListLayout({
    Key? key,
    this.startAlignmentWidget,
    this.endAlignmentWidget,
    this.startAlignmentSpacing,
    this.endAlignmentSpacing,
    this.height = 50,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  }) : super(key: key);

  final List<Widget>? startAlignmentWidget;
  final List<Widget>? endAlignmentWidget;
  final double? startAlignmentSpacing;
  final double? endAlignmentSpacing;
  final Color backgroundColor;
  final double height;
  final EdgeInsets padding;

  List<Widget> _buildSpacing(List<Widget>? widgetList, double? spacing) {
    var newList = <Widget>[];
    for (var widget in widgetList!) {
      newList.add(widget);
      if (widgetList.last != widget) newList.add(SizedBox(width: spacing));
    }
    return newList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: backgroundColor,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildSpacing(
                startAlignmentWidget,
                startAlignmentSpacing,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildSpacing(
                endAlignmentWidget,
                endAlignmentSpacing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
