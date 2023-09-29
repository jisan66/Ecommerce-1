import 'package:ecommerce/presentation/screens/auth/email_verification_screen.dart';
import 'package:ecommerce/presentation/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce/presentation/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      AuthController.isLoggedIn ? Get.offAll(() => const MainBottomNavScreen()) :Get.offAll(() => const EmailVerificationScreen())
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(ImageAssets.craftyBayLogoSVG),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: 16,),
          const Text("version 1.0",style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 16,)
        ],
      ),
    );
  }
}
