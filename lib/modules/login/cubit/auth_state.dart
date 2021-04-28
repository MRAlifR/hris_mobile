part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.inProgress() = InProgress;
  const factory AuthState.authenticated(OdooSession session) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.failed(NetworkExceptions error) = Failed;
}
