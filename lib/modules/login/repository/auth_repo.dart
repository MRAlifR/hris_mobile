import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

import '../../../utils/services/networking/api_response.dart';
import '../../../utils/services/networking/network_exceptions.dart';

class AuthRepo {
  AuthRepo(this.client);
  OdooClient client;
  final storage = const FlutterSecureStorage();

  Future<ApiResponse> getSession() async {
    try {
      final session = await storage.read(key: 'session');
      dynamic sessionJson = jsonDecode(session!);
      var odooSession = OdooSession.fromJson(sessionJson);
      return ApiResponse.success(odooSession);
    } catch (e) {
      return ApiResponse.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponse> logIn(String username, String password) async {
    try {
      var session =
          await client.authenticate('odoo12_ptap', username, password);
      await storage.write(key: 'session', value: jsonEncode(session));
      return ApiResponse.success(session);
    } catch (e) {
      print(e);
      return ApiResponse.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResponse> logOut() async {
    try {
      await client.destroySession();
      await storage.delete(key: 'session');
      return const ApiResponse.success('Sign out success');
    } on OdooException catch (e) {
      print(e);
      return ApiResponse.failure(NetworkExceptions.getDioException(e));
    }
  }
}
