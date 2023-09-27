import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
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
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                SvgPicture.asset(
                  ImageAssets.craftyBayLogoSVG,
                  width: 100,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Please Enter Your Email Address",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (String? emailText) {
                    if (emailText?.isEmpty ?? true) {
                      return "Enter email address";
                    } else if (emailText!.isEmail == false) {
                      return "Enter a valid address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: GetBuilder<EmailVerificationController>(
                        builder: (controller) {
                      if (controller.emailVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                            // Get.to(const OTPVerificationScreen());
                            verifyEmail(controller);
                            _emailTEController.clear();
                          }
                        },
                        child: const Text("Next"),
                      );
                    }))
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final bool response =
        await controller.verifyEmail(_emailTEController.text.trim());
    if (response==true) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("OTP sent to your email")));
      }
      Get.to(() => const OTPVerificationScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Email verification failed! Try again!")));
      }
    }
  }
}
