import 'dart:developer';

import 'package:fetch_api/src/domain/api_domain.dart';
import 'package:fetch_api/src/view/product_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<Map?>? getProoducts() async {
    try {
      final String url = Doamain().productsRoute;

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return {'data': productModelFromJson(response.body)};
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
