import 'dart:developer';

import 'package:fetch_api/src/domain/api_domain.dart';
import 'package:fetch_api/src/view/product_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>>? getProoducts() async {
    // final dio = Dio();
    final String url = Doamain().productsRoute;
    log(url);
    var response = await http.get(Uri.parse(url));
    // final response = await dio.get(
    //   url,
    // );
    if (response.statusCode == 200) {
      log(response.body.toString());
      return productModelFromJson(response.body);
    }
    return [];
  }
}
