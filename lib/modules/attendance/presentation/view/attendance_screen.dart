// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:supercharged/supercharged.dart';

// Project imports:
import 'package:hris_mobile/core/device/location_repo.dart';
import 'package:hris_mobile/core/extension/extension.dart';
import 'package:hris_mobile/core/utils/ui/background/background.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/data/repository/attendance_repo.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/attendance_popup.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/digital_clock.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/gradient_icon.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/hour_indicator.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/location_text.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/round_button.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/attendance_cubit.dart';
import 'package:hris_mobile/modules/attendance/presentation/cubit/location_cubit.dart';

class AttendanceScreen extends StatelessWidget {
  static const id = 'attendance_screen';

  @override
  Widget build(BuildContext context) {
    var _myLocale = Localizations.localeOf(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (context) {
            var locationRepo = LocationRepo();
            return LocationCubit(locationRepo: locationRepo);
          },
        ),
        BlocProvider<AttendanceCubit>(create: (context) {
          var locationCubit = BlocProvider.of<LocationCubit>(context);
          return AttendanceCubit(
            locale: _myLocale,
            locationCubit: locationCubit,
          );
        }),
      ],
      child: AttendanceScreenView(),
    );
  }
}

class AttendanceScreenView extends StatefulWidget {
  AttendanceScreenView({Key? key}) : super(key: key);

  @override
  _AttendanceScreenViewState createState() => _AttendanceScreenViewState();
}

class _AttendanceScreenViewState extends State<AttendanceScreenView>
    with WidgetsBindingObserver {
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

  late AttendanceCubit _attendanceCubit;

  @override
  void initState() {
    super.initState();
    _attendanceCubit = BlocProvider.of<AttendanceCubit>(context);
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print('AppLifecycleState detached');
        break;
      case AppLifecycleState.inactive:
        print('AppLifecycleState inactive');
        break;
      case AppLifecycleState.paused:
        print('AppLifecycleState paused');
        break;
      case AppLifecycleState.resumed:
        print('AppLifecycleState resumed');
        break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;

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
      ),
    );
  }
}
