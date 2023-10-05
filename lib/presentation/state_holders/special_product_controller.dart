import 'package:ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../utility/urls.dart';

class SpecialProductController extends GetxController{
  bool _getSpecialProductInProgress = false;
  bool get getSpecialProductInProgress => _getSpecialProductInProgress;

  ProductModel specialProductModel = ProductModel();

  Future<bool> geSpecialProduct() async{
    _getSpecialProductInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.productsByRemarks("special"));
    _getSpecialProductInProgress = false;
    if(response.isSuccess){
      specialProductModel = ProductModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }
    else{
      update();
      return false;
    }
  }
}