import 'package:ecommerce/presentation/screens/product_list_screen.dart';
import 'package:ecommerce/presentation/state_holders/category_controller.dart';
import 'package:ecommerce/presentation/state_holders/home_slide_controller.dart';
import 'package:ecommerce/presentation/state_holders/new_product_controller.dart';
import 'package:ecommerce/presentation/state_holders/popular_product_controller.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:ecommerce/presentation/utility/image_assets.dart';
import 'package:ecommerce/presentation/widgets/home_carousel_slider.dart';
import 'package:ecommerce/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_card.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              ImageAssets.craftyBayLogoNAVpng,
              width: 120,
            ),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person_2_outlined,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(icon: Icons.call_outlined, onTap: () {}),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
                icon: Icons.notifications_on_outlined, onTap: () {})
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                // color: Colors.grey,
                height: 45,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1)),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.grey.shade200,
                    hintText: "Search",
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search_rounded),
                      onPressed: () {},
                    ),
                  ),
                ),

              ),
              const SizedBox(height : 16),
              GetBuilder<HomeSlideController>(
                builder: (homeSliderController) {
                  if(homeSliderController.getHomeSliderInProgress)
                    {
                      return const Center(child:  CircularProgressIndicator());
                    }
                  return HomeSlider(
                    sliderData: homeSliderController.sliderModel.data ?? [],
                  );
                }
              ),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(title: "All Categories", onTap: () {Get.find<MainBottomNavController>().changeScreen(1);}),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategoryInProgress){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        itemCount: categoryController.categoryModel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryCard(categoryData: categoryController.categoryModel.data![index]);
                        });
                  }
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(title: "Popular", onTap: () {Get.to(() => const ProductListScreen());}),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                    if(popularProductController.getPopularProductInProgress){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularProductController.popularProductModel.data?.length ?? 0,
                        itemBuilder: (context, index)
                    {
                      return ProductCard(
                        productData: popularProductController.popularProductModel.data![index],
                      );
                    });
                  }
                ),
              ),
              SectionHeader(title: "Special", onTap: () {Get.find<MainBottomNavController>().changeScreen(3);}),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index)
                    {
                      // return const ProductCard();
                    }),
              ),
              SectionHeader(title: "New", onTap: () {Get.find<MainBottomNavController>().changeScreen(3);}),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: GetBuilder<NewProductController>(
                  builder: (newProductController) {
                    if(newProductController.getNewProductInProgress){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProductController.newProductModel.data?.length ?? 0,
                        itemBuilder: (context, index)
                        {
                          return ProductCard(productData: newProductController.newProductModel.data![index]);
                        });
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


