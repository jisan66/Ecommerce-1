import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/utility/network_caller.dart';
import 'package:ecommerce/presentation/utility/urls.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';

class PopularProductController extends GetxController{
  bool _getPopularProductInProgress = false;
  bool get getPopularProductInProgress => _getPopularProductInProgress;

  ProductModel _popularProductModel = ProductModel();
  ProductModel get popularProductModel => _popularProductModel;

  Future<bool> getPopularProduct() async{
    _getPopularProductInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.productsByRemarks("popular"));
    _getPopularProductInProgress = false;
    if(response.isSuccess){
      _popularProductModel = ProductModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    }
    else{
      update();
      return false;
    }
  }
}