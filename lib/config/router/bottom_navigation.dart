import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hris_mobile/modules/attendance/view/attendance_list_screen.dart';
import 'package:hris_mobile/modules/attendance/view/attendance_screen.dart';
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
    Shader paint_0 = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        -0.1,
        0.4,
        1.1,
      ],
      colors: ['#3E80DD'.toColor(), '#6672D6'.toColor(), '#9A87E4'.toColor()],
    ).createShader(Rect.fromLTWH(0, 0, 200, 700));

    List<PersistentBottomNavBarItem> _navBarsItems() => [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: _l10n.home,
            activeColorPrimary: ShaderMask(
              shaderCallback: (Rect bound) {
                return LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    -0.1,
                    0.4,
                    1.1,
                  ],
                  colors: [
                    '#3E80DD'.toColor(),
                    '#6672D6'.toColor(),
                    '#9A87E4'.toColor()
                  ],
                ).createShader(bound);
              },
              child: const Icon(Icons.home),
            ),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.article),
            title: _l10n.attendance,
            activeColorPrimary: Paint()..shader = paint_0,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            title: _l10n.profile,
            activeColorPrimary: paint_0.color,
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
