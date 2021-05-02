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

  void appStarted() async {
    emit(const AuthState.inProgress());
    var apiResult = await authRepo.getSession();
    apiResult.when(
      success: (session) {
        emit(AuthState.authenticated(session));
      },
      failure: (NetworkExceptions e) {
        emit(const AuthState.unauthenticated());
      },
    );
  }

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

  void signOut() async {
    await authRepo.logOut();
    emit(const AuthState.unauthenticated());
  }
}
