import 'package:odoo_rpc/odoo_rpc.dart';

import '../../../utils/services/networking/api_response.dart';
import '../../../utils/services/networking/network_exceptions.dart';

class AuthRepo {
  AuthRepo(this.client);
  OdooClient client;

  Future<ApiResponse> logIn(String username, String password) async {
    try {
      var session =
          await client.authenticate('odoo12_ptap', username, password);
      return ApiResponse.success(session);
    } catch (e) {
      print(e);
      return ApiResponse.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<void> logOut() async {
    try {
      await client.destroySession();
    } on OdooException catch (e) {
      print(e);
    }
  }
}
