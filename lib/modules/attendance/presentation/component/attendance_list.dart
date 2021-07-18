// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:supercharged/supercharged.dart';

// Project imports:
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/core/utils/ui/component/state_widget.dart';
import 'package:hris_mobile/modules/attendance/data/model/attendance_item.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_list_item.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_list_weekend.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_list_cubit.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/month_selection_cubit.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({
    Key? key,
  }) : super(key: key);

  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  late final ScrollController _scroll = ScrollController();
  late final RefreshController _refresh = RefreshController();

  void _scrollToBottom() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _scroll.animateTo(
        _scroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refresh.dispose();
    _scroll.dispose();
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
      minDate.until(maxDate.plus(day: 1)).forEach((curDate) {
        if (curDate.weekday == DateTime.sunday) {
          dataRow.add(AttendanceListWeekend(
            saturdayDate: curDate.minus(day: 1).toStringAsDateOnly(_locale),
            sundayDate: curDate.toStringAsDateOnly(_locale),
          ));
        } else if (curDate.weekday != DateTime.saturday) {
          var filteredItems = items.filter(
            (item) => item.checkIn!.day == curDate.day,
          );
          filteredItems.isNotEmpty
              ? dataRow.add(AttendanceListItem(filteredItems.first))
              : dataRow.add(AttendanceListItem.empty(curDate));
        }
      });
      return dataRow;
    }

    List<Widget> _buildChildren(BoxConstraints constraints, listState) {
      return listState.state.maybeWhen(
        loading: () => [
          Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const Loading(),
          ),
        ],
        failed: (message) => [
          Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Failed(message: message),
          ),
        ],
        empty: () => [
          Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const Center(
              child: Empty(),
            ),
          ),
        ],
        orElse: () => [Container()],
        success: getDataRow,
      );
    }

    return BlocListener<AttendanceListCubit, AttendanceListState>(
      listener: (context, state) {
        state.maybeMap(
          success: (_) => _refresh
            ..refreshCompleted()
            ..loadComplete(),
          refreshFailed: (_) => _refresh
            ..refreshFailed()
            ..loadFailed(),
          empty: (_) => _refresh
            ..refreshCompleted()
            ..loadFailed(),
          orElse: () {},
        );
      },
      child: Builder(
        builder: (context) {
          var monthState = context.watch<MonthSelectionCubit>();
          var listState = context.watch<AttendanceListCubit>();
          // _scrollToBottom();
          return Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  var widgetList = _buildChildren(constraints, listState);
                  return Scrollbar(
                    controller: _scroll,
                    child: SmartRefresher(
                      header: const ClassicHeader(),
                      controller: _refresh,
                      onRefresh: () => context
                          .read<AttendanceListCubit>()
                          .refreshAttendanceList(monthState.state.dateTime),
                      child: ListView.builder(
                        controller: _scroll,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => widgetList[index],
                        itemCount: widgetList.length,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
