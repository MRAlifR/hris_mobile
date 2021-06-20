import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hris_mobile/modules/attendance/view/attendance_screen.dart';
import 'package:kartal/kartal.dart';

import 'package:hris_mobile/l10n/l10n.dart';
import 'package:hris_mobile/modules/login/cubit/auth_cubit.dart';
import 'package:hris_mobile/modules/login/view/components/login_appbar.dart';
import 'package:hris_mobile/modules/login/view/components/login_header.dart';
import 'package:hris_mobile/modules/login/view/navigation_screen.dart';

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
    final _authCubit = BlocProvider.of<AuthCubit>(context);
    final l10n = context.l10n;

    Widget showButtonContinue() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: context.verticalPaddingNormal,
        ),
        onPressed: () {
          context.navigateToReset(AttendanceScreen.id);
          // if (_form.currentState!.saveAndValidate()) {
          //   String username = _form.currentState!.value['username'];
          //   String password = _form.currentState!.value['password'];
          //   _authCubit.signIn(username, password);
          // }
        },
        child: const Text('CONTINUE'),
      );
    }

    Widget showLoading() {
      return Column(
        children: [
          const CircularProgressIndicator(),
        ],
      );
    }

    ScaffoldFeatureController showMessage(String message) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

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
                    decoration: InputDecoration(
                      labelText: l10n.emailLabel,
                      border: const OutlineInputBorder(),
                      hintText: l10n.emailHint,
                      prefixIcon: const Icon(
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
                    decoration: InputDecoration(
                      labelText: l10n.passwordLabel,
                      border: const OutlineInputBorder(),
                      hintText: l10n.passwordHint,
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 23,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Icon(
                          hidePassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye,
                          size: 23,
                        ),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                  ),
                  context.emptySizedHeightBoxLow3x,
                  BlocConsumer<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is InProgress) return showLoading();
                      return showButtonContinue();
                    },
                    listener: (context, state) {
                      state.maybeWhen(
                        authenticated: (session) {
                          final username = session.userName;
                          context.navigateToReset(AttendanceScreen.id);
                          showMessage(l10n.loginSuccessMessage(username));
                        },
                        failed: (error) {
                          showMessage(l10n.loginFailedMessage);
                        },
                        orElse: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
