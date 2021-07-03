import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_list_screen.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_screen.dart';
import 'package:hris_mobile/modules/login/view/splash_screen.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:supercharged/supercharged.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);
  static const id = 'bottom_navigation_screen';
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;

    List<PersistentBottomNavBarItem> _navBarsItems() => [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: _l10n.home,
            activeColorPrimary: '#6672D6'.toColor(),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.article),
            title: _l10n.attendance,
            activeColorPrimary: '#6672D6'.toColor(),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            title: _l10n.profile,
            activeColorPrimary: '#6672D6'.toColor(),
          ),
        ];

    List<Widget> _buildScreens() => [
          AttendanceScreen(),
          AttendanceListScreen(),
          AttendanceListScreen(),
        ];

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      backgroundColor: '#FAF8FA'.toColor(),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
