import 'package:ecommerce/presentation/screens/auth/complete_profile_screen.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/image_assets.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SvgPicture.asset(
                ImageAssets.craftyBayLogoSVG,
                width: 75,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Enter OTP Code",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black87.withOpacity(.7),
                    letterSpacing: .75),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "A 4 Digit OTP Code has been Sent",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade500.withOpacity(.8),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                length: 4,
                obscureText: false,
                animationType: AnimationType.slide,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: AppColors.primaryColor,
                  activeColor:AppColors.primaryColor,
                  selectedFillColor: Colors.white
                ),
                cursorColor: AppColors.primaryColor,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  // print("Allowing to paste $text");
                  return true;
                },
                appContext: context,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const CompleteProfileScreen());
                    },
                    child: const Text("Next"),
                  )),
              const SizedBox(height: 50,),
              RichText(text: const TextSpan(
                children: [
                  TextSpan(text: "This code will expire in ",
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold
                  )),
                  TextSpan(
                    text: "120s",
                    style: TextStyle(
                      color: AppColors.primaryColor
                    )
                  )
                ]
              )),
              TextButton(onPressed: (){}, child: const Text("Resend Code",
                  style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold
              )))
            ],
          ),
        ),
      )),
    );
  }
}
