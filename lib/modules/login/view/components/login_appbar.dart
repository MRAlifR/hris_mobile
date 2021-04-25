import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kartal/kartal.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  LoginAppBar() : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.navigation.pop(),
        color: const Color(0xFFF7F8F9),
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(
        'Sign In',
        style: context.textTheme.headline6!.copyWith(
          fontWeight: FontWeight.w600,
          color: const Color(0xFFF7F8F9),
        ),
      ),
    );
  }
}
