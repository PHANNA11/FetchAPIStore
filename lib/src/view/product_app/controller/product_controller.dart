import 'dart:developer';

import 'package:fetch_api/src/view/product_app/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../domain/api_domain.dart';

class Produccontroller {
  List<ProductModel> _list = [];
  RxList<ProductModel> get product => _list.obs;

  //var repo = ProductRepository();
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
