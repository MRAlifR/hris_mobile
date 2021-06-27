import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hris_mobile/modules/attendance/cubit/attendance_cubit.dart';
import 'package:hris_mobile/modules/attendance/cubit/location_cubit.dart';
import 'package:hris_mobile/modules/attendance/repository/location_repo.dart';
import 'package:hris_mobile/modules/attendance/view/attendance_list_screen.dart';
import 'package:hris_mobile/modules/attendance/view/attendance_screen.dart';
import 'package:hris_mobile/modules/login/view/login_screen.dart';
import 'package:hris_mobile/modules/login/view/navigation_screen.dart';
import 'package:hris_mobile/modules/login/view/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case AttendanceScreen.id:
        return MaterialPageRoute(
          builder: (_) => AttendanceScreen(),
        );
      case AttendanceListScreen.id:
        return MaterialPageRoute(
          builder: (_) => AttendanceListScreen(),
        );
      case NavigationScreen.id:
        return MaterialPageRoute(
          builder: (_) => NavigationScreen(),
        );
      default:
        return null;
    }
  }

  List<Route<dynamic>> onGenerateInitialRoutes(String route) {
    return [MaterialPageRoute(builder: (_) => LoginScreen())];
  }
}
