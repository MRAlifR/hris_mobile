import 'package:auto_route/auto_route.dart';
import 'package:hris_mobile/core/router/bottom_navigation.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_list_screen.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_screen.dart';
import 'package:hris_mobile/modules/login/view/login_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginScreen,
      initial: true,
      path: '/login',
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    groupTabRouter
  ],
)
class $AppsRouter {}

const groupTabRouter = AutoRoute(
  path: '/navigation',
  name: 'NavigationRouter',
  page: BottomNavigation,
  children: [
    AutoRoute(
      path: 'attendance',
      name: 'AttendanceRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: AttendanceScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: 'attendance_list',
      name: 'AttendanceListRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: AttendanceListScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: 'profil',
      name: 'ProfilRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: AttendanceScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
);
