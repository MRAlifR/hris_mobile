import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hris_mobile/core/utils/ui/background/background.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/data/repository/attendance_repo_impl.dart';
import 'package:hris_mobile/modules/attendance/domain/entity/attendance.dart';
import 'package:hris_mobile/modules/attendance/domain/repository/attendance_repo.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_table.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/month_selection.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_list_data_cubit.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_list_view_cubit.dart';
import 'package:supercharged/supercharged.dart';
import 'package:kartal/kartal.dart';
import 'package:expandable/expandable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AttendanceListScreen extends StatelessWidget {
  const AttendanceListScreen({Key? key}) : super(key: key);
  static const id = 'attendance_list_screen';

  @override
  Widget build(BuildContext context) {
    // return AttendanceListScreenView();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AttendanceListDataCubit>(
          create: (context) => AttendanceListDataCubit(
            attendanceRepo: AttendanceRepoImpl(),
          ),
        ),
        BlocProvider<AttendanceListViewCubit>(
          create: (context) => AttendanceListViewCubit(
            dataCubit: BlocProvider.of<AttendanceListDataCubit>(context),
          ),
        )
      ],
      child: AttendanceListScreenView(),
    );
  }
}

class AttendanceListScreenView extends StatefulWidget {
  AttendanceListScreenView({Key? key}) : super(key: key);

  @override
  _AttendanceListScreenState createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreenView> {
  final checkInColorList = [
    '#3E80DD'.toColor(),
    '#6672D6'.toColor(),
    '#9A87E4'.toColor()
  ];
  final checkOutColorList = [
    '#8E3098'.toColor(),
    '#C8307D'.toColor(),
    '#F04980'.toColor()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _locale = Localizations.localeOf(context);
    final _cubit = BlocProvider.of<AttendanceListViewCubit>(context);

    return BlocBuilder<AttendanceListViewCubit, AttendanceListViewState>(
      builder: (context, state) {
        var date = state.maybeWhen(
          loading: (dateTime) => dateTime,
          success: (dateTime, attendances) => dateTime,
          noData: (dateTime) => dateTime,
          orElse: () => DateTime.now(),
        );
        print('INI DIA $date');
        var items = state.maybeWhen(
          success: (dateTime, attendances) => attendances,
          orElse: () => <AttendanceItem>[],
        );
        print('INI DIA $items');

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
                      MonthSelection(
                        date: date,
                        onLeftTap: () => setState(_cubit.decreaseMonth),
                        onRightTap: () => setState(_cubit.increaseMonth),
                      ),
                      const AttendanceListHeader(),
                      Flexible(
                        child: ListView(
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          children: items
                              .map(
                                (item) => AttendanceRow(
                                  checkInTime: item.checkIn!.toStringAsTime,
                                  checkOutTime: item.checkOut!.toStringAsTime,
                                  date: date.toStringAsDateOnly(_locale),
                                  day: date.toStringAsDay(_locale),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// Future<Widget> getDataRow() async {
//   var dataRow = <Widget>[];
//   var hMin7Date = DateTime.now().minus(day: 30);
//   for (date in hMin7Date.rangeTo(DateTime.now())) {
//     if (date.weekday == DateTime.sunday) {
//       dataRow.add(AttendanceWeekendRow(
//         saturdayDate: (date.day - 1).toString().padLeft(2),
//         sundayDate: date.toStringAsDateOnly(_locale),
//       ));
//     } else if (date.weekday != DateTime.saturday) {
//       dataRow.add(AttendanceRow(
//         date: date.day.toString().padLeft(2),
//         day: date.toStringAsDay(_locale),
//       ));
//     }
//   }
//   return Expanded(
//     child: SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         children: dataRow,
//       ),
//     ),
//   );
// }
