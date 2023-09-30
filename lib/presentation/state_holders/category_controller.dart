import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/utility/network_caller.dart';
import 'package:ecommerce/presentation/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  bool _getCategoryInProgress = false;
  bool get getCategoryInProgress => _getCategoryInProgress;

  CategoryModel categoryModel = CategoryModel();

  Future<bool> getCategoryList() async{
    _getCategoryInProgress = true;
    NetworkResponse response = await NetworkCaller().getRequest(Urls.categoryList);
    _getCategoryInProgress = false;
    if(response.isSuccess) {
      categoryModel = CategoryModel.fromJson(response.responseBody ?? {});
      update();
        return true;
      }
    else {
      update();
      return false;
    }
}
}
