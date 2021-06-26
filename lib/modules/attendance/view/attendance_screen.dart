import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/cubit/attendance_cubit.dart';
import 'package:hris_mobile/modules/attendance/cubit/location_cubit.dart';
import 'package:hris_mobile/modules/attendance/view/attendance_list_screen.dart';
import 'package:hris_mobile/modules/attendance/view/component/attendance_popup.dart';
import 'package:hris_mobile/modules/attendance/view/component/digital_clock.dart';
import 'package:hris_mobile/modules/attendance/view/component/gradient_icon.dart';
import 'package:hris_mobile/modules/attendance/view/component/hour_indicator.dart';
import 'package:hris_mobile/modules/attendance/view/component/location_text.dart';
import 'package:hris_mobile/modules/attendance/view/component/round_button.dart';
import 'package:hris_mobile/utils/extension/extension.dart';
import 'package:hris_mobile/utils/ui/background/background.dart';
import 'package:kartal/kartal.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class AttendanceScreen extends StatefulWidget {
  static const id = 'attendance_screen';

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    final _attendanceCubit = BlocProvider.of<AttendanceCubit>(context);

    return BlocListener<AttendanceCubit, AttendanceState>(
      listener: (context, state) {
        state.maybeMap(
          checkIn: (state) {
            showDialog<String>(
              context: context,
              builder: (_) => AttendancePopup(
                iconColors: checkInColorList,
                address: state.checkInAddress,
              ),
            );
          },
          checkOut: (state) {
            showDialog<String>(
              context: context,
              builder: (_) => AttendancePopup(
                iconColors: checkInColorList,
                address: state.checkOutAddress,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            const Background(),
            const Positioned.fill(
              top: 60,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'ABHIPERS',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Positioned.fill(
              top: 83,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Abhimata Persada',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const Positioned.fill(
              top: 56,
              right: 20,
              child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    foregroundColor: Colors.blue,
                    radius: 23,
                    backgroundImage: AssetImage('assets/images/angela.jpg'),
                  )),
            ),
            Positioned.fill(
              top: 170,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DigitalClock(),
                    BlocBuilder<AttendanceCubit, AttendanceState>(
                      builder: (context, state) {
                        return Text(
                          state.currentDate,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 90,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocBuilder<AttendanceCubit, AttendanceState>(
                      builder: (context, state) {
                        return state.maybeMap(
                          checkIn: (checkInState) {
                            return RoundButton(
                              title: _l10n.checkOut.toUpperCase(),
                              colorList: checkOutColorList,
                              onTap: _attendanceCubit.checkOutButton,
                            );
                          },
                          orElse: () {
                            return RoundButton(
                              title: _l10n.checkIn.toUpperCase(),
                              colorList: checkInColorList,
                              onTap: _attendanceCubit.checkInButton,
                            );
                          },
                        );
                      },
                    ),
                    context.emptySizedHeightBoxLow,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.15,
                      ),
                      child: BlocBuilder<LocationCubit, LocationState>(
                        builder: (context, state) {
                          var _address = state.maybeWhen(
                            changed: (position, address) => address,
                            failed: (message) => message,
                            orElse: () => _l10n.locationNotFound,
                          );
                          return LocationText(address: _address);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fill(
              bottom: 50,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: BlocBuilder<AttendanceCubit, AttendanceState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HourIndicator(
                              icon: GradientIcon(
                                Icons.history,
                                size: 35,
                                colorList: checkInColorList,
                              ),
                              time: state.map(
                                initial: (state) => '--:--',
                                checkIn: (state) => state.checkIn,
                                checkOut: (state) => state.checkIn,
                              ),
                              subtitle: _l10n.checkIn,
                            ),
                            HourIndicator(
                              icon: GradientIcon(
                                Icons.update,
                                size: 35,
                                colorList: checkInColorList,
                              ),
                              time: state.maybeMap(
                                checkOut: (state) => state.checkOut,
                                orElse: () => '--:--',
                              ),
                              subtitle: _l10n.checkOut,
                            ),
                            HourIndicator(
                              icon: GradientIcon(
                                Icons.schedule,
                                size: 32,
                                colorList: checkInColorList,
                              ),
                              time: state.maybeMap(
                                checkOut: (state) => state.checkOut,
                                orElse: () => '--:--',
                              ),
                              subtitle: _l10n.workingHours,
                            ),
                          ],
                        );
                      },
                    ),
                  )),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: checkInColorList[1],
          onTap: (value) {
            switch (value) {
              case 1:
                context.navigateName(AttendanceListScreen.id);
                break;
              default:
            }
          },
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
      ),
    );
  }
}
