// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hris_mobile/core/router/apps_router.gr.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

// Project imports:
import 'package:hris_mobile/core/router/app_router.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/login/cubit/auth_cubit.dart';
import 'package:hris_mobile/modules/login/repository/auth_repo.dart';

class App extends StatelessWidget {
  App({Key? key, required this.odooURL}) : super(key: key);

  final String odooURL;
  final _appsRouter = AppsRouter();

  @override
  Widget build(BuildContext context) {
    final odooClient = OdooClient(odooURL);
    final authRepo = AuthRepo(odooClient);

    return BlocProvider<AuthCubit>(
      lazy: false,
      create: (_) => AuthCubit(authRepo),
      child: MaterialApp.router(
        theme: ThemeData(
          accentColor: const Color(0xFF13B9FF),
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerDelegate: _appsRouter.delegate(),
        routeInformationParser: _appsRouter.defaultRouteParser(),
      ),
    );
  }
}
