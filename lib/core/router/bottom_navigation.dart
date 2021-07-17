// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hris_mobile/core/router/apps_router.gr.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/gradient_icon.dart';

// Package imports:
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:supercharged/supercharged.dart';
import 'package:kartal/kartal.dart';

// Project imports:
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_list_screen.dart';
import 'package:hris_mobile/modules/attendance/presentation/view/attendance_screen.dart';
import 'package:hris_mobile/modules/login/view/splash_screen.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);
  static const id = 'bottom_navigation_screen';

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;

    return AutoTabsScaffold(
      routes: const [
        AttendanceRouter(),
        AttendanceListRouter(),
        ProfilRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: _l10n.home,
              icon: GradientIcon(
                Icons.home,
                size: 30,
                colorList: [
                  '#3E80DD'.toColor(),
                  '#6672D6'.toColor(),
                  '#9A87E4'.toColor()
                ],
              ),
            ),
            BottomNavigationBarItem(
              label: _l10n.attendance,
              icon: GradientIcon(
                Icons.article,
                size: 30,
                colorList: [
                  '#3E80DD'.toColor(),
                  '#6672D6'.toColor(),
                  '#9A87E4'.toColor()
                ],
              ),
            ),
            BottomNavigationBarItem(
              label: _l10n.profile,
              icon: GradientIcon(
                Icons.person,
                size: 30,
                colorList: [
                  '#3E80DD'.toColor(),
                  '#6672D6'.toColor(),
                  '#9A87E4'.toColor()
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
