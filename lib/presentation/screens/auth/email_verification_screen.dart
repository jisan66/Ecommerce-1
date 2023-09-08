import 'package:ecommerce/presentation/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [
              const SizedBox(height: 80,),
              SvgPicture.asset(
                ImageAssets.craftyBayLogoSVG,
                width: 100,
              ),
              const SizedBox(height: 8,),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8,),
              Text(
                "Please Enter Your Email Address",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24,),
              TextFormField(
                decoration: const InputDecoration(hintText: "Email",),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const OTPVerificationScreen());
                    },
                    child: const Text("Next"),
                  ))
            ],
        ),
      ),
          )),
    );
  }
}
