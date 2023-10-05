import 'dart:developer';

import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/utility/network_caller.dart';
import 'package:ecommerce/presentation/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;

  bool get addToCartInProgress => _addToCartInProgress;

  Future<bool> addToCart(int productId, String color, String size) async {
    _addToCartInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        Urls.addToCart,
        {"product_id": productId, "color": color, "size": size});
    _addToCartInProgress = false;
    log(response.statusCode.toString());
    log(response.responseBody.toString());
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
