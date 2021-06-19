import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hris_mobile/modules/attendance/view/component/card_separator.dart';
import 'package:hris_mobile/modules/attendance/view/component/maps_button.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:kartal/kartal.dart';

class AttendanceScreen extends StatefulWidget {
  static const id = 'attendance_screen';

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Maps
  GoogleMapController? _controller;
  Circle? circle;
  Marker? marker;
  BitmapDescriptor? markerIcon;
  // Clock
  String? hours;
  String? minutes;
  String? seconds;
  String? address = '';
  Timer? timer;
  // Bloc
  // AttendanceCubit attendanceCubit;
  // AuthCubit authBloc;
  // User currentUser;
  // List<Attendance> attendance;
  // SlidingSheet
  bool isCollapsed = true;
  double topSheetOpacity = 1;

  void clockInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (v) {
      setState(() {
        var secondTemp = DateTime.now().second;
        var minuteTemp = DateTime.now().minute;
        var hourTemp = DateTime.now().hour;
        hours = hourTemp < 10 ? '0$hourTemp' : '$hourTemp';
        minutes = minuteTemp < 10 ? '0$minuteTemp' : '$minuteTemp';
        seconds = secondTemp < 10 ? '0$secondTemp' : '$secondTemp';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // attendanceCubit = context.bloc<AttendanceCubit>();
    // authBloc = context.bloc<AuthCubit>();
    // currentUser = authBloc.state.props[0];
    // locationInit();
    clockInit();
    // BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(devicePixelRatio: 0.1), 'assets/images/blue_dot.png').then((onValue) {
    //   markerIcon = onValue;
    // });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Widget topSheetView = Opacity(
      opacity: topSheetOpacity,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            context.emptySizedHeightBoxLow,
            CardSeparator(
              firstLineWidth: 30,
              secondLineWidth: 40,
            ),
            context.emptySizedHeightBoxLow,
            Text(
              '$hours : $minutes : $seconds',
              style: const TextStyle(
                fontSize: 30,
                letterSpacing: 1,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 30,
              ),
              title: Text('Name'),
              subtitle: Text('M Rizki Alif R'),
            ),
            const ListTile(
              leading: Icon(
                Icons.location_on,
                size: 30,
              ),
              title: Text('Your Location'),
              subtitle: Text('Jl. Jalan'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Check In'),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      body: SlidingSheet(
        minHeight: height - (height / 1.618),
        elevation: 8,
        cornerRadius: 16,
        cornerRadiusOnFullscreen: 0,
        listener: (sheetState) {
          setState(() {
            topSheetOpacity = 1 - sheetState.progress;
            if (sheetState.progress == 1.0) {
              isCollapsed = false;
            } else {
              isCollapsed = true;
            }
          });
        },
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [1 - (1 / 1.618), 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          height: height / 1.618,
          width: width,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-6.210559, 106.815628),
                  zoom: 14.4746,
                ),
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                circles: Set.of((circle != null) ? [circle as Circle] : []),
                markers: Set.of((marker != null) ? [marker as Marker] : []),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
              ),
              Positioned(
                bottom: 30,
                right: 20,
                child: MapsButton(
                  icon: const Icon(Icons.gps_fixed),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                isCollapsed ? topSheetView : const SizedBox.shrink(),
                // BlocBuilder<AttendanceCubit, AttendanceState>(
                //   builder: (context, state) {
                //     if (state is AttendanceSuccess) {
                //       attendance = state.props[0];
                //       return ListView.builder(
                //         itemCount: attendance.length,
                //         shrinkWrap: true,
                //         itemBuilder: (context, index) {
                //           final attendanceList = attendance[index];
                //           return ListTile(
                //             leading: Icon(
                //               Icons.account_circle,
                //               size: 30,
                //             ),
                //             title: Text(attendanceList.checkIn.toString()),
                //             subtitle: Text(attendanceList.checkOut.toString()),
                //           );
                //         },
                //       );
                //     }
                //     return Text('loading');
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
