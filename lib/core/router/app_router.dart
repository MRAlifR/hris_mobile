import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hris_mobile/core/router/bottom_navigation.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_list_screen.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_screen.dart';
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
      case BottomNavigation.id:
        return MaterialPageRoute(
          builder: (_) => BottomNavigation(),
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
