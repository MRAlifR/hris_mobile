import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:hris_mobile/modules/login/cubit/auth_cubit.dart';
import 'package:hris_mobile/modules/login/repository/auth_repo.dart';
import 'package:hris_mobile/utils/services/networking/api_response.dart';
import 'package:hris_mobile/utils/services/networking/network_exceptions.dart';
import 'package:mocktail/mocktail.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class MockNetworkExceptions extends Mock implements NetworkExceptions {}

class MockOdooSession extends Mock implements OdooSession {}

void main() {
  group('AuthCubit', () {
    final odooSession = MockOdooSession();
    final networkExceptions = MockNetworkExceptions();
    late AuthRepo _authRepo;
    late AuthCubit _authCubit;

    setUp(() {
      _authRepo = MockAuthRepo();
      _authCubit = AuthCubit(_authRepo);
    });

    test('Login account', () async {
      when(
        () => _authRepo.logIn('mrizki.alif@ptap.co.id', '123'),
      ).thenAnswer(
          (invocation) async => const ApiResponse<String>.success('Success'));

      expect(
        await _authRepo.logIn('mrizki.alif@ptap.co.id', '123'),
        const ApiResponse<String>.success('Success'),
      );
    });

    test('initial state is [AuthState.initial()]', () {
      expect(_authCubit.state, equals(const AuthState.initial()));
    });

    blocTest(
      'emits [AuthState.authenticated(session)] when signIn method is added',
      build: () {
        when(() => _authRepo.logIn('mrizki.alif@ptap.co.id', '123'))
            .thenAnswer((_) async => ApiResponse.success(odooSession));
        return _authCubit;
      },
      act: (AuthCubit cubit) => cubit.signIn('mrizki.alif@ptap.co.id', '123'),
      expect: () => [
        const AuthState.inProgress(),
        AuthState.authenticated(odooSession),
      ],
    );

    blocTest(
      'emits [AuthState.failed(e)] when signIn method is added',
      build: () {
        when(() => _authRepo.logIn('mrizki.alif@ptap.co.id', '123'))
            .thenAnswer((_) async => ApiResponse.failure(networkExceptions));
        return _authCubit;
      },
      act: (AuthCubit cubit) => cubit.signIn('mrizki.alif@ptap.co.id', '123'),
      expect: () => [
        const AuthState.inProgress(),
        AuthState.failed(networkExceptions),
      ],
    );

    blocTest(
      'emits [AuthState.unauthenticated()] when signOut method is added',
      build: () {
        when(() => _authRepo.logOut())
            .thenAnswer((_) async => const ApiResponse.success('Success'));
        return _authCubit;
      },
      act: (AuthCubit cubit) => cubit.signOut(),
      expect: () => [
        const AuthState.inProgress(),
        const AuthState.unauthenticated(),
      ],
    );

    blocTest(
      'emits [AuthState.failed(e)] when signOut method is added',
      build: () {
        when(() => _authRepo.logOut())
            .thenAnswer((_) async => ApiResponse.failure(networkExceptions));
        return _authCubit;
      },
      act: (AuthCubit cubit) => cubit.signOut(),
      expect: () => [
        const AuthState.inProgress(),
        AuthState.failed(networkExceptions),
      ],
    );

    tearDown(() {
      _authCubit.close();
    });
  });
}
