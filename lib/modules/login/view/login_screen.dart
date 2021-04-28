import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kartal/kartal.dart';

import '../cubit/auth_cubit.dart';
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
    final _authCubit = BlocProvider.of<AuthCubit>(context);

    Widget showButtonContinue() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: context.verticalPaddingNormal,
        ),
        onPressed: () {
          if (_form.currentState!.saveAndValidate()) {
            String username = _form.currentState!.value['username'];
            String password = _form.currentState!.value['password'];
            _authCubit.signIn(username, password);
          }
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
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      hintText: 'Enter your password',
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
                          showMessage('Login Success');
                        },
                        failed: (error) {
                          showMessage('Login Failed');
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
