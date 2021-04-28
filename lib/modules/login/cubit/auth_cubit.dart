import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

import '../../../utils/services/networking/network_exceptions.dart';
import '../repository/auth_repo.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(const AuthState.initial());
  AuthRepo authRepo;

  void signIn(String username, String password) async {
    emit(const AuthState.inProgress());
    var apiResult = await authRepo.logIn(username, password);
    apiResult.when(
      success: (session) {
        emit(AuthState.authenticated(session));
      },
      failure: (NetworkExceptions e) {
        emit(AuthState.failed(e));
      },
    );
  }
}
