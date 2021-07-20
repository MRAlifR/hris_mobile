// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:expandable/expandable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

// Project imports:
import 'package:hris_mobile/constants/color.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_list_layout.dart';
import 'package:supercharged/supercharged.dart';

class AttendanceListItem extends StatelessWidget {
  const AttendanceListItem(this.attendanceItem, [this.dateTime]);

  const AttendanceListItem.empty(this.dateTime, [this.attendanceItem]);

  final AttendanceItem? attendanceItem;
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    final _locale = Localizations.localeOf(context);

    return ExpandableNotifier(
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          useInkWell: false,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToExpand: true,
          tapBodyToCollapse: true,
          hasIcon: false,
        ),
        header: attendanceItem != null
            ? AttendanceListItemCollapsed(
                checkIn: attendanceItem?.checkIn?.toStringAsTime ?? '--:--',
                checkOut: attendanceItem?.checkOut?.toStringAsTime ?? '--:--',
                workedHour: Duration(
                  seconds: (attendanceItem!.workedHours * 3600).toInt(),
                ).toStringAsTimeHM,
                date: attendanceItem!.checkIn!.toStringAsDateOnly(_locale),
                day: attendanceItem!.checkIn!.toStringAsDay(_locale),
              )
            : AttendanceListItemCollapsed(
                checkIn: '--:--',
                checkOut: '--:--',
                workedHour: '--:--',
                date: dateTime!.toStringAsDateOnly(_locale),
                day: dateTime!.toStringAsDay(_locale),
              ),
        collapsed: Container(
          color: Colors.white,
          child: Divider(
            thickness: 1,
            indent: context.width * 0.22,
            color: Colors.grey.shade200,
          ),
        ),
        expanded: attendanceItem != null
            ? AttendanceListItemExpanded(attendanceItem: attendanceItem!)
            : Container(),
      ),
    );
  }
}

class AttendanceListItemCollapsed extends StatelessWidget {
  const AttendanceListItemCollapsed({
    required this.date,
    required this.day,
    required this.checkIn,
    required this.checkOut,
    required this.workedHour,
  });

  final String date;
  final String day;
  final String checkIn;
  final String checkOut;
  final String workedHour;

  @override
  Widget build(BuildContext context) {
    var textColor = Colors.black;

    if (workedHour.allBefore('h') != '') {
      var hour = int.parse(workedHour.allBefore('h'));
      var minute = int.parse(workedHour.allBetween(' ', 'm'));
      if (hour < 9) {
        textColor = kErrorColor;
      } else {
        textColor = minute >= 30 ? kSuccessColor : Colors.black;
      }
    }

    var textStyle = TextStyle(
      fontSize: 14,
      color: textColor,
      fontWeight: FontWeight.w500,
    );

    return AttendanceListLayout(
      height: context.height * 0.06,
      padding: const EdgeInsets.only(left: 24.0),
      startAlignmentWidget: [
        AttendanceListLayoutContainer(
          widthScale: 0.2,
          child: Container(
            width: 45,
            height: 45,
            alignment: Alignment.center,
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
        AttendanceListLayoutContainer(
          widthScale: 0.2,
          child: RichText(
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
                TextSpan(
                  text: checkIn,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
        AttendanceListLayoutContainer(
          widthScale: 0.2,
          child: RichText(
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
                TextSpan(
                  text: checkOut,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ],
      endAlignmentWidget: [
        AttendanceListLayoutContainer(
          widthScale: 0.3,
          alignment: Alignment.centerRight,
          child: Text(
            workedHour,
            textAlign: TextAlign.end,
            style: textStyle,
          ),
        ),
        AttendanceListLayoutContainer(
          widthScale: 0.1,
          child: Align(
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
        ),
      ],
    );
  }
}

class AttendanceListItemExpanded extends StatelessWidget {
  const AttendanceListItemExpanded({
    Key? key,
    required this.attendanceItem,
  }) : super(key: key);

  final AttendanceItem attendanceItem;

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

  List<Widget> _buildAttendanceList() {
    return attendanceItem.attendances.map((attendance) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    border: Border.all(
                      color: Colors.blueGrey.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.timer,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        'Time Marked',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attendance.checkIn!.toStringAsTime!,
                      style: const TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 11,
                          color: Colors.grey,
                        ),
                        Flexible(
                          child: RichText(
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: attendance.address,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attendance.checkOut != null
                          ? attendance.checkOut!.toStringAsTime!
                          : '',
                      style: const TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        attendance.addressOut != null
                            ? const Icon(
                                Icons.location_on,
                                size: 11,
                                color: Colors.grey,
                              )
                            : Container(),
                        Flexible(
                          child: RichText(
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: attendance.addressOut,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
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
              decoration: const BoxDecoration(
                color: kWarningColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
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
                        child: Text(
                          'Forgot to check in or check out? Call HCM for fixing the data...',
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
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
          const SizedBox(height: 8),
          ..._buildAttendanceList()
        ],
      ),
    );
  }
}
