import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/auth_cubit.dart';
import 'login_screen.dart';
import 'navigation_screen.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/images/app_logo.png'),
                ),
              ),
            ),
          ),
        ),
      ),
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (session) {
            context.navigateToReset(NavigationScreen.id);
          },
          unauthenticated: () {
            context.navigateToReset(LoginScreen.id);
          },
          orElse: () {},
        );
      },
    );
  }
}
