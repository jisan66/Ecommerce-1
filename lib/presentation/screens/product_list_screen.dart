import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holders/main_bottom_nav_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All Products",style: TextStyle(color: AppColors.primaryColor),),
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: AppColors.primaryColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 8),
              itemCount: 21,
              itemBuilder: (context, index){
                return const FittedBox(child: ProductCard());
              }),
        ),
      ),
    );
  }
}