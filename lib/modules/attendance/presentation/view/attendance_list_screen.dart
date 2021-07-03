import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hris_mobile/core/utils/ui/background/background.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/data/repository/AttendanceRepoImpl.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_table.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/month_selection.dart';
import 'package:hris_mobile/core/extension/extension.dart';
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
  Widget? widgetTest;

  Future<void> getDataRow() async {
    var attendanceRepoImpl = AttendanceRepoImpl();
    var attendanceList = await attendanceRepoImpl.getAttendanceList();
    var dataRow = <Widget>[];
    attendanceList.when(
      success: (list) {
        for (var attendance in list) {
          var alo = attendance.checkIn ??= DateTime.now();
          print(alo);
          dataRow.add(AttendanceRow(
            date: alo.toString().padLeft(2),
            day: alo.toString().padLeft(2),
          ));
        }
      },
      failure: (error) {},
    );
    // for (date in hMin7Date.rangeTo(DateTime.now())) {
    //   if (date.weekday == DateTime.sunday) {
    //     dataRow.add(AttendanceWeekendRow(
    //       saturdayDate: (date.day - 1).toString().padLeft(2),
    //       sundayDate: date.toStringAsDateOnly(_locale),
    //     ));
    //   } else if (date.weekday != DateTime.saturday) {
    //     dataRow.add(AttendanceRow(
    //       date: date.day.toString().padLeft(2),
    //       day: date.toStringAsDay(_locale),
    //     ));
    //   }
    // }
    widgetTest = Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: dataRow,
        ),
      ),
    );
  }

  void test() async {
    await getDataRow();
  }

  @override
  void initState() {
    super.initState();
    test();
  }

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _locale = Localizations.localeOf(context);

    // Future<Widget> getDataRow() async {
    //   var attendanceRepoImpl = AttendanceRepoImpl();
    //   var attendanceList = await attendanceRepoImpl.getAttendanceList();
    //   var dataRow = <Widget>[];
    //   var hMin7Date = DateTime.now().minus(day: 30);
    //   attendanceList.when(
    //     success: (list) {
    //       for (var attendance in list) {
    //         var alo = attendance.checkIn ??= 'Mon';
    //         dataRow.add(AttendanceRow(
    //           date: alo.substring(0, 2),
    //           day: alo.substring(0, 2),
    //         ));
    //       }
    //     },
    //     failure: (error) {},
    //   );
    //   // for (date in hMin7Date.rangeTo(DateTime.now())) {
    //   //   if (date.weekday == DateTime.sunday) {
    //   //     dataRow.add(AttendanceWeekendRow(
    //   //       saturdayDate: (date.day - 1).toString().padLeft(2),
    //   //       sundayDate: date.toStringAsDateOnly(_locale),
    //   //     ));
    //   //   } else if (date.weekday != DateTime.saturday) {
    //   //     dataRow.add(AttendanceRow(
    //   //       date: date.day.toString().padLeft(2),
    //   //       day: date.toStringAsDay(_locale),
    //   //     ));
    //   //   }
    //   // }
    //   return Expanded(
    //     child: SingleChildScrollView(
    //       physics: const BouncingScrollPhysics(),
    //       child: Column(
    //         children: dataRow,
    //       ),
    //     ),
    //   );
    // }

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
                  widgetTest ??= Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
