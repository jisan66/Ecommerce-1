import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:ecommerce/presentation/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/image_assets.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: form,
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
                  controller: _otpTEController,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.slide,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      inactiveColor: AppColors.primaryColor,
                      activeColor: AppColors.primaryColor,
                      selectedFillColor: Colors.white),
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
                  validator: (String? otp) {
                    if (otp?.isEmpty ?? true) {
                      return "Please enter otp";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OTPVerificationController>(
                        builder: (otpController) {
                      if (otpController.otpVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          if (form.currentState!.validate()) {
                            verifyOTP(otpController);
                          }
                        },
                        child: const Text("Next"),
                      );
                    })),
                const SizedBox(
                  height: 50,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "This code will expire in ",
                      style: TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "120s",
                      style: TextStyle(color: AppColors.primaryColor))
                ])),
                TextButton(
                    onPressed: () {},
                    child: const Text("Resend Code",
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> verifyOTP(OTPVerificationController controller) async {
    final bool response =
        await controller.verifyOTP(widget.email, _otpTEController.text.trim());
    if (response == true) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Verified Successfully!")));
        Get.to(() => const HomeScreen());
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP Verification Failed!")));
      }
    }
  }
}
