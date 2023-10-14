import 'package:ecommerce/data/models/car_list_model.dart';
import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../utility/urls.dart';

class CartListController extends GetxController {
  bool _getCartListInProgress = false;

  bool get getCartListInProgress => _getCartListInProgress;

  CartListModel cartListModel = CartListModel();

  double totalPrice=0 ;

  Future<bool> getCartList() async {
    _getCartListInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getCartList);
    _getCartListInProgress = false;
    if (response.isSuccess) {
      cartListModel = CartListModel.fromJson(response.responseBody ?? {});
      calculateTotalPrice();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  void changeNumberOfProduct(int cartID, int numberOfProduct){
    cartListModel.data?.firstWhere((cartData) => (cartData.id==cartID)).numberOfProducts=numberOfProduct;
    calculateTotalPrice();
  }

  void calculateTotalPrice(){
    totalPrice =0;
    for(CartData data in cartListModel.data ?? []){
      totalPrice += (data.numberOfProducts * 100);
    }
    update();
  }

  Future<bool> deleteCartList(int productID) async{
  NetworkResponse response = await NetworkCaller.getRequest(Urls.deleteCartList(productID));
  if(response.isSuccess){
    cartListModel.data!.removeWhere((element) => element.productId==productID);
    update();
    return true;
  }
  else{
    return false;
  }
  }
}
