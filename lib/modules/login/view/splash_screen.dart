import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hris_mobile/modules/login/cubit/auth_cubit.dart';
import 'package:hris_mobile/modules/login/view/login_screen.dart';
import 'package:hris_mobile/modules/login/view/navigation_screen.dart';
import 'package:kartal/kartal.dart';

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
