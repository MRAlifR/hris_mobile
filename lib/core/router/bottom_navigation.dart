// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:hris_mobile/constants/color.dart';
import 'package:hris_mobile/core/router/app_router.gr.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/attendance/presentation/component/gradient_icon.dart';

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
          fixedColor: kPrimaryColor,
          items: [
            BottomNavigationBarItem(
              label: _l10n.home,
              icon: GradientIcon(
                Icons.home,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: _l10n.attendance,
              icon: GradientIcon(
                Icons.article,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: _l10n.profile,
              icon: GradientIcon(
                Icons.person,
                size: 30,
              ),
            ),
          ],
        );
      },
    );
  }
}
