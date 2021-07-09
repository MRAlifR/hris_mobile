// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

// Project imports:
import '../../../core/error/network_exceptions.dart';
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
        emit(AuthState.authenticated(session!));
      },
      failure: (error) {
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
      failure: (error) {
        emit(AuthState.failed(error));
      },
    );
  }

  void signOut() async {
    emit(const AuthState.inProgress());
    var apiResult = await authRepo.logOut();
    apiResult.when(
      success: (message) {
        emit(const AuthState.unauthenticated());
      },
      failure: (error) {
        emit(AuthState.failed(error));
      },
    );
  }
}
