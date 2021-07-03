import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supercharged/supercharged.dart';
import 'package:kartal/kartal.dart';
import 'package:expandable/expandable.dart';

class AttendanceTableLayout extends StatelessWidget {
  const AttendanceTableLayout({
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
    return AttendanceTableLayout(
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

class AttendanceRow extends StatelessWidget {
  const AttendanceRow({
    Key? key,
    required this.day,
    required this.date,
  }) : super(key: key);

  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          useInkWell: false,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToExpand: true,
          tapBodyToCollapse: true,
          hasIcon: false,
        ),
        header: AttendanceListRowHeader(date: date, day: day),
        collapsed: Container(),
        expanded: const AttendanceListRowBottom(),
      ),
    );
  }
}

class AttendanceListRowHeader extends StatelessWidget {
  const AttendanceListRowHeader({
    Key? key,
    required this.day,
    required this.date,
  }) : super(key: key);

  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 14,
      color: Colors.green,
      fontWeight: FontWeight.w500,
    );
    return Container(
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        children: [
          AttendanceTableLayout(
            height: context.height * 0.06,
            padding: const EdgeInsets.only(left: 24.0),
            startAlignmentWidget: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Container(
                  width: 43,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey.shade50),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        day,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: context.width * 0.06),
              RichText(
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Transform.rotate(
                        angle: 45 * math.pi / 180,
                        child: const FaIcon(
                          FontAwesomeIcons.arrowRight,
                          size: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 1),
                    ),
                    const TextSpan(
                      text: '09:15',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(width: context.width * 0.09),
              RichText(
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Transform.rotate(
                        angle: 45 * math.pi / 180,
                        child: const FaIcon(
                          FontAwesomeIcons.arrowUp,
                          size: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 1),
                    ),
                    const TextSpan(
                      text: '18:45',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ],
            endAlignmentWidget: [
              RichText(
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: '08h 30m',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ExpandableIcon(
                  theme: const ExpandableThemeData(
                    useInkWell: false,
                    expandIcon: Icons.chevron_right,
                    collapseIcon: Icons.chevron_right,
                    iconColor: Colors.blueGrey,
                    iconSize: 20.0,
                    iconRotationAngle: math.pi / 2,
                    hasIcon: false,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            indent: context.width * 0.22,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}

class AttendanceListRowBottom extends StatelessWidget {
  const AttendanceListRowBottom({
    Key? key,
  }) : super(key: key);

  Widget _buildText(String title, String value) {
    return Row(
      children: [
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 9,
            color: Colors.black54,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 3,
        bottom: 17,
        left: 17,
        right: 17,
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: '#FEEAD0'.toColor(),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              height: context.height * 0.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: FaIcon(
                          FontAwesomeIcons.exclamationCircle,
                          size: 15,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildText('Check In Time', '09:30'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildText('Updated Check In Time', '09:30'),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: FaIcon(
                      FontAwesomeIcons.solidCommentDots,
                      size: 15,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceWeekendRow extends StatelessWidget {
  const AttendanceWeekendRow({
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
