// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/month_selection_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:supercharged/supercharged.dart';

// Project imports:
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/core/utils/ui/component/state_widget.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_table.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_list_cubit.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({
    Key? key,
  }) : super(key: key);

  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  late final ScrollController _scroll = ScrollController();
  late RefreshController _refresh = RefreshController();

  void _scrollToBottom() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _scroll.animateTo(
        _scroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refresh.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refresh.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final _locale = Localizations.localeOf(context);

    List<Widget> getDataRow(
      DateTime minDate,
      DateTime maxDate,
      List<AttendanceItem> items,
    ) {
      var dataRow = <Widget>[];
      for (var curDate in minDate.until(maxDate.plus(day: 1))) {
        if (curDate.weekday == DateTime.sunday) {
          dataRow.add(AttendanceWeekendRow(
            saturdayDate: curDate.minus(day: 1).toStringAsDateOnly(_locale),
            sundayDate: curDate.toStringAsDateOnly(_locale),
          ));
        } else if (curDate.weekday != DateTime.saturday) {
          var filteredItems =
              items.filter((item) => item.checkIn!.day == curDate.day);
          if (filteredItems.isNotEmpty)
            dataRow.add(AttendanceRow(filteredItems.first));
          else {
            dataRow.add(AttendanceRow.empty(curDate));
          }
        }
      }
      return dataRow;
    }

    return BlocListener<AttendanceListCubit, AttendanceListState>(
      listener: (context, state) {
        state.maybeMap(
          success: (_) => _refresh.loadComplete(),
          orElse: () {},
        );
      },
      child: Builder(
        builder: (context) {
          var monthState = context.watch<MonthSelectionCubit>().state.dateTime;
          var listState = context.watch<AttendanceListCubit>().state;
          print('MONTHSTATE LUAR $monthState');

          return listState.maybeWhen(
            loading: () => const Loading(),
            failed: (message) => Failed(message: message),
            empty: () => const Empty(),
            orElse: () => Container(),
            success: (minDate, maxDate, items) {
              print('MONTHSTATE TENGAH $monthState');
              _scrollToBottom();
              return Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Scrollbar(
                    controller: _scroll,
                    child: SmartRefresher(
                      header: const ClassicHeader(),
                      controller: _refresh,
                      onRefresh: () => context
                          .read<AttendanceListCubit>()
                          .refreshAttendanceList(monthState),
                      child: ListView(
                        controller: _scroll,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        children: getDataRow(minDate, maxDate, items),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
