import 'dart:developer';

import 'package:fetch_api/src/view/product_app/model/product_model.dart';
import 'package:fetch_api/src/view/product_app/repo/product_repo.dart';
import 'package:get/get.dart';

class Produccontroller extends GetxController
    with StateMixin<List<ProductModel>> {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change([], status: RxStatus.success());
    getProoducts();
  }

  var repo = ProductRepository();
  Future getProoducts() async {
    if (status.isLoadingMore) return;
    if (!status.isLoadingMore && value!.isNotEmpty) {
      change(value, status: RxStatus.loadingMore());
    } else {
      change([], status: RxStatus.loading());
    }
    var response = await repo.getProoducts();

    if (response != null) {
      if (response['data'].isNotEmpty) {
        value?.addAll(response['data']);
        return change(value, status: RxStatus.success());
      } else {
        return change([], status: RxStatus.empty());
      }
    }
    return change([], status: RxStatus.empty());
  }
}

class ProduccontrollerBiding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Produccontroller>(() => Produccontroller());
  }
}
