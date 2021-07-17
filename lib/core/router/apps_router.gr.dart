// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../modules/attendance/presentation/view/attendance_list_screen.dart'
    as _i6;
import '../../modules/attendance/presentation/view/attendance_screen.dart'
    as _i5;
import '../../modules/login/view/login_screen.dart' as _i3;
import 'bottom_navigation.dart' as _i4;

class AppsRouter extends _i1.RootStackRouter {
  AppsRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.LoginScreen();
        }),
    NavigationRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<NavigationRouterArgs>(
              orElse: () => const NavigationRouterArgs());
          return _i4.BottomNavigation(key: args.key);
        }),
    AttendanceRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    AttendanceListRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    ProfilRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    AttendanceRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.AttendanceScreen();
        }),
    AttendanceListRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.AttendanceListScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i1.RouteConfig(LoginRoute.name, path: '/login', children: [
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i1.RouteConfig(NavigationRouter.name, path: '/navigation', children: [
          _i1.RouteConfig(AttendanceRouter.name, path: 'attendance', children: [
            _i1.RouteConfig(AttendanceRoute.name, path: ''),
            _i1.RouteConfig('*#redirect',
                path: '*', redirectTo: '', fullMatch: true)
          ]),
          _i1.RouteConfig(AttendanceListRouter.name,
              path: 'attendance_list',
              children: [
                _i1.RouteConfig(AttendanceListRoute.name, path: ''),
                _i1.RouteConfig('*#redirect',
                    path: '*', redirectTo: '', fullMatch: true)
              ]),
          _i1.RouteConfig(ProfilRouter.name, path: 'profil', children: [
            _i1.RouteConfig(AttendanceRoute.name, path: ''),
            _i1.RouteConfig('*#redirect',
                path: '*', redirectTo: '', fullMatch: true)
          ])
        ])
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/login', initialChildren: children);

  static const String name = 'LoginRoute';
}

class NavigationRouter extends _i1.PageRouteInfo<NavigationRouterArgs> {
  NavigationRouter({_i2.Key? key, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/navigation',
            args: NavigationRouterArgs(key: key),
            initialChildren: children);

  static const String name = 'NavigationRouter';
}

class NavigationRouterArgs {
  const NavigationRouterArgs({this.key});

  final _i2.Key? key;
}

class AttendanceRouter extends _i1.PageRouteInfo {
  const AttendanceRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'attendance', initialChildren: children);

  static const String name = 'AttendanceRouter';
}

class AttendanceListRouter extends _i1.PageRouteInfo {
  const AttendanceListRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'attendance_list', initialChildren: children);

  static const String name = 'AttendanceListRouter';
}

class ProfilRouter extends _i1.PageRouteInfo {
  const ProfilRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'profil', initialChildren: children);

  static const String name = 'ProfilRouter';
}

class AttendanceRoute extends _i1.PageRouteInfo {
  const AttendanceRoute() : super(name, path: '');

  static const String name = 'AttendanceRoute';
}

class AttendanceListRoute extends _i1.PageRouteInfo {
  const AttendanceListRoute() : super(name, path: '');

  static const String name = 'AttendanceListRoute';
}
