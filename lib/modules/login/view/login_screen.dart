import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kartal/kartal.dart';

import 'components/login_appbar.dart';
import 'components/login_header.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: LoginAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FormBuilder(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const LoginHeader(),
                  context.emptySizedHeightBoxLow3x,
                  FormBuilderTextField(
                    obscureText: false,
                    textAlign: TextAlign.start,
                    name: 'username',
                    decoration: const InputDecoration(
                      labelText: 'Email or Username',
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email or username',
                      prefixIcon: Icon(
                        Icons.account_circle,
                        size: 23,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                  ),
                  context.emptySizedHeightBoxLow,
                  FormBuilderTextField(
                    obscureText: hidePassword,
                    textAlign: TextAlign.start,
                    name: 'password',
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 23,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 23,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: context.verticalPaddingNormal,
                    ),
                    onPressed: () {},
                    child: const Text('CONTINUE'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
