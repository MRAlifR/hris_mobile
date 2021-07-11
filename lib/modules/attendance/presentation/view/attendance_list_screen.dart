// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hris_mobile/core/device/api_call.dart';
import 'package:hris_mobile/modules/attendance/data/data_source/attendance_local_source.dart';
import 'package:hris_mobile/modules/attendance/data/data_source/attendance_remote_source.dart';
import 'package:supercharged/supercharged.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// Project imports:
import 'package:hris_mobile/core/utils/ui/background/background.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/data/repository/attendance_repo.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_list.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_table.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/month_selection.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_list_cubit.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/month_selection_cubit.dart';

class AttendanceListScreen extends StatelessWidget {
  const AttendanceListScreen({Key? key}) : super(key: key);
  static const id = 'attendance_list_screen';

  @override
  Widget build(BuildContext context) {
    // return AttendanceListScreenView();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AttendanceListCubit>(
          create: (context) {
            return AttendanceListCubit(
              attendanceRepo: AttendanceRepo(
                localSource: AttendanceLocalSource(
                  box: Hive.box(
                    AttendanceLocalSource.attendanceLocalKey,
                  ),
                ),
                remoteSource: AttendanceRemoteSource(
                  apiCall: ApiCall('https://exercisemralifr.herokuapp.com/'),
                ),
              ),
            );
          },
        ),
        BlocProvider<MonthSelectionCubit>(
          create: (context) => MonthSelectionCubit(),
        ),
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
  Widget build(BuildContext context) {
    final _l10n = context.l10n;

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MonthSelection(),
                  const AttendanceListHeader(),
                  const AttendanceList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
