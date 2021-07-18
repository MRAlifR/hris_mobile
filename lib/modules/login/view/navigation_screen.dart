// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

// Project imports:
import 'package:hris_mobile/modules/login/cubit/auth_cubit.dart';
import 'package:hris_mobile/modules/login/view/login_screen.dart';

class NavigationScreen extends StatelessWidget {
  static const id = 'navigation_screen';

  @override
  Widget build(BuildContext context) {
    final _authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _authCubit.signOut();
            context.navigateToReset(LoginScreen.id);
          },
          child: const Text('LOG OUT'),
        ),
      ),
    );
  }
}
