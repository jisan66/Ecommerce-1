import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_details_data.dart';
import 'package:ecommerce/data/models/product_details_model.dart';
import 'package:ecommerce/data/utility/network_caller.dart';
import 'package:ecommerce/presentation/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _getProductDetailsInProgress = false;
  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  List<String> colors=[];
  List<String> sizes=[];

  ProductDetails productDetails = ProductDetails();

  Future<bool> getProductDetails(int id) async{
    _getProductDetailsInProgress = true;
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress = false;
    if(response.isSuccess){
      productDetails = (ProductDetailsModel.fromJson(response.responseBody ?? {})).data!.first;
      colors = productDetails.color?.split(",") ?? [];
      print(colors.toString());
      sizes = productDetails.size?.split(",") ?? [];
      print(sizes.toString());
      update();
      return true;
    }
    else{
      update();
      return false;
    }
  }
}