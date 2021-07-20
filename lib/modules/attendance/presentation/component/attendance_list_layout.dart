// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendanceListLayout extends StatelessWidget {
  AttendanceListLayout({
    Key? key,
    this.startAlignmentWidget,
    this.endAlignmentWidget,
    this.height = 50,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  }) : super(key: key);

  final List<AttendanceListLayoutContainer>? startAlignmentWidget;
  final List<AttendanceListLayoutContainer>? endAlignmentWidget;
  final Color backgroundColor;
  final double height;
  final EdgeInsets padding;

  List<Widget> _buildChildren(
    List<AttendanceListLayoutContainer>? widgetList,
    BoxConstraints constraints,
  ) =>
      widgetList == null
          ? <Widget>[]
          : List<Widget>.from(
              widgetList.map(
                (e) => Container(
                  width: constraints.maxWidth * e.widthScale,
                  alignment: e.alignment,
                  child: e.child,
                ),
              ),
            );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: backgroundColor,
      child: Padding(
        padding: padding,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildChildren(startAlignmentWidget, constraints),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildChildren(endAlignmentWidget, constraints),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AttendanceListLayoutContainer extends StatelessWidget {
  const AttendanceListLayoutContainer({
    Key? key,
    required this.child,
    required this.widthScale,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  final double widthScale;
  final Widget child;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
