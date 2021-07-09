// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

// Project imports:
import '../cubit/auth_cubit.dart';
import 'login_screen.dart';

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
