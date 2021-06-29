import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/view/component/month_selection.dart';
import 'package:hris_mobile/utils/ui/background/background.dart';
import 'package:hris_mobile/utils/extension/extension.dart';
import 'package:supercharged/supercharged.dart';
import 'package:kartal/kartal.dart';
import 'package:expandable/expandable.dart';

class AttendanceListScreen extends StatefulWidget {
  AttendanceListScreen({Key? key}) : super(key: key);
  static const id = 'attendance_list_screen';

  @override
  _AttendanceListScreenState createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreen> {
  final checkInColorList = [
    '#3E80DD'.toColor(),
    '#6672D6'.toColor(),
    '#9A87E4'.toColor()
  ];
  final checkOutColorList = [
    '#8E3098'.toColor(),
    '#C8307D'.toColor(),
    '#F04980'.toColor(),
  ];

  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _locale = Localizations.localeOf(context);

    Widget getDataRow() {
      var dataRow = <Widget>[];
      var hMin7Date = DateTime.now().minus(day: 30);
      for (date in hMin7Date.rangeTo(DateTime.now())) {
        if (date.weekday == DateTime.sunday) {
          dataRow.add(AttendanceWeekendRow(
            saturdayDate: (date.day - 1).toString().padLeft(2),
            sundayDate: date.toStringAsDateOnly(_locale),
          ));
        } else if (date.weekday != DateTime.saturday) {
          dataRow.add(AttendanceRow(
            date: date.day.toString().padLeft(2),
            day: date.toStringAsDay(_locale),
          ));
        }
      }
      return Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: dataRow,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          _l10n.attendance,
          style: TextStyle(
            color: Colors.black87.withOpacity(0.8),
            fontSize: 23,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          Positioned.fill(
            top: 90,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  MonthSelection(),
                  const AttendanceListHeader(),
                  getDataRow()
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: checkInColorList[1],
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(
            label: _l10n.home,
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: _l10n.attendance,
            icon: const Icon(Icons.article),
          ),
          BottomNavigationBarItem(
            label: _l10n.profile,
            icon: const Icon(Icons.person),
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
    return Container(
      width: context.width,
      height: context.height * 0.045,
      color: '#FAF9FA'.toColor(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            width: context.width * 0.2,
            child: const Text(
              'Date',
              style: textStyle,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: context.width * 0.2,
            child: const Text(
              'Check In',
              style: textStyle,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: context.width * 0.2,
            child: const Text(
              'Check Out',
              style: textStyle,
            ),
          ),
          const SizedBox(width: 17),
          Container(
            padding: const EdgeInsets.only(right: 18),
            width: context.width * 0.3,
            child: const Text(
              'Working Hr\'s',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ],
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
          Container(
            width: context.width,
            height: context.height * 0.06,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: context.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 17,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey.shade50),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                const SizedBox(width: 10),
                Container(
                  width: context.width * 0.2,
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
                        const TextSpan(
                          text: '09:15',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: context.width * 0.2,
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
                        const TextSpan(
                          text: '18:45',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: context.width * 0.21,
                  child: RichText(
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
                ),
                Container(
                  width: context.width * 0.1,
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
            ),
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
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          useInkWell: false,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToExpand: true,
          tapBodyToCollapse: true,
          hasIcon: false,
        ),
        header: AttendanceListRowHeader(
          date: date,
          day: day,
        ),
        collapsed: Container(),
        expanded: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 13),
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
                          Center(
                            child: const FaIcon(
                              FontAwesomeIcons.exclamationCircle,
                              size: 15,
                              color: Colors.blueGrey,
                            ),
                          ),
                          context.emptySizedWidthBoxLow3x,
                          Row(
                            children: [
                              Center(
                                child: const Text(
                                  'Check In Time',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Center(
                                child: const Text(
                                  '09:20',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          context.emptySizedWidthBoxLow3x,
                          context.emptySizedWidthBoxLow3x,
                          Row(
                            children: [
                              Center(
                                child: const Text(
                                  'Updated Check In Time',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Center(
                                child: const Text(
                                  '09:20',
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: const FaIcon(
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
        ),
      ),
    );
  }
}
