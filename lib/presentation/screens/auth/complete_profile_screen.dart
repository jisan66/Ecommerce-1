import 'package:ecommerce/presentation/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../home_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    "Complete Profile",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black87.withOpacity(.7),
                        letterSpacing: .75),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    "Get started with us with your details",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade500.withOpacity(.8),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Full Name",contentPadding: EdgeInsets.all(8)),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Last Name",contentPadding: EdgeInsets.all(8)),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Mobile",contentPadding: EdgeInsets.all(8)),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "City",contentPadding: EdgeInsets.all(8)),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                      maxLines: 6,
                      decoration: const InputDecoration(hintText: "Shipping Address",contentPadding: EdgeInsets.all(8)),
                    ),
                  const SizedBox(height: 16,),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(const HomeScreen());
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
