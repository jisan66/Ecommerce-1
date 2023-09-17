import 'package:get/get.dart';

class MainBottomNavController extends GetxController
{
  int currentScreen = 0;

  void changeScreen(int index)
  {
    currentScreen = index;
    update();
  }
  void backToHome() {
    changeScreen(0);
  }
}