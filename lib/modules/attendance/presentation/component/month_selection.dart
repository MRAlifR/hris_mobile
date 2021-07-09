// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

// Project imports:
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_list_cubit.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/month_selection_cubit.dart';

class MonthSelection extends StatelessWidget {
  const MonthSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _locale = Localizations.localeOf(context);

    return Container(
      height: 60,
      width: context.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade50,
            spreadRadius: 1,
            blurRadius: 20, // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => context.read<MonthSelectionCubit>().decreaaseMonth(),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Icon(
                Icons.chevron_left,
                size: 24,
              ),
            ),
          ),
          BlocConsumer<MonthSelectionCubit, MonthSelectionState>(
            listener: (context, state) {
              print('LISTENER STATE $state');
              context
                  .read<AttendanceListCubit>()
                  .getAttendances(state.dateTime);
            },
            builder: (context, state) {
              print('BUILDER STATE $state');
              return RichText(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: FaIcon(
                        FontAwesomeIcons.calendarAlt,
                        size: 18,
                        color: Colors.blue,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 7),
                    ),
                    TextSpan(
                      text: state.dateTime.toStringAsMonthYear(_locale),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          InkWell(
            onTap: () => context.read<MonthSelectionCubit>().increaseMonth(),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Icon(
                Icons.chevron_right,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
