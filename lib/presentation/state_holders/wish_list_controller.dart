import 'package:ecommerce/data/models/wish_list_model.dart';
import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../utility/urls.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;

  bool get getWishListInProgress => _getWishListInProgress;

  WishListModel wishListModel = WishListModel();

  Future<bool> getWishList() async {
    _getWishListInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getWishList);
    _getWishListInProgress = false;
    if (response.isSuccess) {
      wishListModel = WishListModel.fromJson(response.responseBody ?? {});
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
