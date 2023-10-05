import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/slider_model.dart';
import 'package:ecommerce/data/utility/network_caller.dart';
import 'package:ecommerce/presentation/utility/urls.dart';
import 'package:get/get.dart';

class HomeSlideController extends GetxController{
  bool _getHomeSliderInProgress = false;
  bool get getHomeSliderInProgress => _getHomeSliderInProgress;
  
  SliderModel _sliderModel = SliderModel();
  SliderModel get sliderModel => _sliderModel;

  String _message="";
  String get message => _message;
  
  Future<bool> getHomeSlider() async{
    _getHomeSliderInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.homeSlider);
    _getHomeSliderInProgress = false;
    update();
    if(response.isSuccess)
      {
        _sliderModel = SliderModel.fromJson(response.responseBody ?? {});
        update();
        return true;
      }
    else{
      _message = "Slider Data Load Failed!";
      update();
      return false;
    }
  }
  
}