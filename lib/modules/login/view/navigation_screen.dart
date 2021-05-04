import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import 'login_screen.dart';
import 'package:kartal/kartal.dart';

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
