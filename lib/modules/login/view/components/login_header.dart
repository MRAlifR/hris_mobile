import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kartal/kartal.dart';
import '../../../../l10n/l10n.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
          l10n.upperLoginHeader,
          textAlign: TextAlign.center,
          style: context.appTheme.textTheme.headline4,
        ),
        Text(
          l10n.lowerLoginHeader,
          textAlign: TextAlign.center,
          style: context.appTheme.textTheme.bodyText2,
        )
      ],
    );
  }
}
