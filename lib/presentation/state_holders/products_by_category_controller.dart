import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/utility/network_caller.dart';
import 'package:ecommerce/presentation/utility/urls.dart';
import 'package:get/get.dart';

class ProductsByCategoryController extends GetxController{
  bool _getProductsByCategoryInProgress = false;
  bool get getProductsByCategoryInProgress => _getProductsByCategoryInProgress;

  ProductModel productModel = ProductModel();

  Future<bool> getProductsByCategory(int categoryId) async{
    _getProductsByCategoryInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductsByCategory(categoryId));
    _getProductsByCategoryInProgress = false;
    update();
    if(response.isSuccess){
      productModel = ProductModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }
    else{
      return false;
    }
  }

}