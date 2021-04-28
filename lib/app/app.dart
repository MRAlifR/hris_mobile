// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hris_mobile/config/router/app_router.dart';
import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/login/cubit/auth_cubit.dart';
import 'package:hris_mobile/modules/login/repository/auth_repo.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final odooClient = OdooClient('http://192.168.43.67:8067');
    final authRepo = AuthRepo(odooClient);
    final _appRouter = AppRouter();

    return BlocProvider<AuthCubit>(
      lazy: false,
      create: (_) => AuthCubit(authRepo),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: const Color(0xFF13B9FF),
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: _appRouter.onGenerateRoute,
        onGenerateInitialRoutes: _appRouter.onGenerateInitialRoutes,
      ),
    );
  }
}
