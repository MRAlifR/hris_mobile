// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:hris_mobile/modules/login/cubit/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  final authCubit = MockAuthCubit();
  whenListen(
    authCubit,
    Stream.fromIterable([Initial(), InProgress()]),
    initialState: Initial(),
  );
  print(authCubit.state);
  // expect(authCubit.state, equals(Initial()));
}
