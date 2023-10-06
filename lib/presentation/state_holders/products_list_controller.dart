import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/utility/network_caller.dart';
import 'package:ecommerce/presentation/utility/urls.dart';
import 'package:get/get.dart';

class ProductsListController extends GetxController{
  bool _getProductListInProgress = false;
  bool get getProductListInProgress => _getProductListInProgress;

  ProductModel productModel = ProductModel();

  Future<bool> getProductsByCategory(int categoryId) async{
    _getProductListInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductsByCategory(categoryId));
    _getProductListInProgress = false;
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
  void setModel(ProductModel productModel1){
    productModel = productModel1;
    update();
  }
}