import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

import '../../../core/utils/result.dart';
import '../../../core/error/network_exceptions.dart';

class AuthRepo {
  AuthRepo(this.client);
  OdooClient client;
  final storage = const FlutterSecureStorage();

  Future<Result<NetworkExceptions, OdooSession>> getSession() async {
    try {
      final session = await storage.read(key: 'session');
      dynamic sessionJson = jsonDecode(session!);
      var odooSession = OdooSession.fromJson(sessionJson);
      return Result.success(odooSession);
    } catch (e) {
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<Result> logIn(String username, String password) async {
    try {
      var session =
          await client.authenticate('odoo12_ptap', username, password);
      await storage.write(key: 'session', value: jsonEncode(session));
      return Result.success(session);
    } catch (e) {
      print(e);
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<Result> logOut() async {
    try {
      await client.destroySession();
      await storage.delete(key: 'session');
      return Result.success('Sign out success');
    } on OdooException catch (e) {
      print(e);
      return Result.failure(NetworkExceptions.getDioException(e));
    }
  }
}
