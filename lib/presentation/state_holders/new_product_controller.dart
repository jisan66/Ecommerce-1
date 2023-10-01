import 'package:ecommerce/data/models/product_by_remark_model.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../utility/urls.dart';

class NewProductController extends GetxController{
  bool _getNewProductInProgress = false;
  bool get getNewProductInProgress => _getNewProductInProgress;

  ProductByRemarkModel newProductModel = ProductByRemarkModel();

  Future<bool> geNewProduct() async{
    _getNewProductInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller().getRequest(Urls.productsByRemarks("new"));
    _getNewProductInProgress = false;
    if(response.isSuccess){
      newProductModel = ProductByRemarkModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }
    else{
      update();
      return false;
    }
  }
}