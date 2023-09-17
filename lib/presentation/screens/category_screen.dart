import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:ecommerce/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text("Category List", style: TextStyle(
              color: AppColors.primaryColor,
            )
            ),
            leading: IconButton(onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor,),)
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 100,
              itemBuilder: (context, index) {
                return const FittedBox(
                  child: CategoryCard(),
                );
              }),
        ),
      ),
    );
  }
}
