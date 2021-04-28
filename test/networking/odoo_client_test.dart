import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hris_mobile/utils/services/networking/api_response.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

void main() async {
  var odooDbName = 'odoo12_ptap';
  var odooUrl = 'http://192.168.43.67:8067';
  final odooClient = OdooClient(odooUrl);
  try {
    var session =
        await odooClient.authenticate(odooDbName, 'admin@ptap.co.id', '123');
  } on OdooException catch (e) {
    print(e);
    odooClient.close();
  }
}
