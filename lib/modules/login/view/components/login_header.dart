import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kartal/kartal.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Hero(
            tag: 'logo',
            child: Container(
              height: 200.0,
              child: Image.asset('assets/images/app_logo.png'),
            ),
          ),
        ),
        Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: context.appTheme.textTheme.headline4,
        ),
        Text(
          'Sign in with your email and password  \nor continue with social media',
          textAlign: TextAlign.center,
          style: context.appTheme.textTheme.bodyText2,
        )
      ],
    );
  }
}
