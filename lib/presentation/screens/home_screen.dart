import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:ecommerce/presentation/utility/image_assets.dart';
import 'package:ecommerce/presentation/widgets/home_carousel_slider.dart';
import 'package:ecommerce/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/product_card.dart';

import '../utility/app_colors.dart';
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
              const HomeSlider(),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(title: "All Categories", onTap: () {}),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 90,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CategoryCard();
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(title: "Popular", onTap: () {}),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                    itemBuilder: (context, index)
                {
                  return const ProductCard();
                }),
              ),
              SectionHeader(title: "Special", onTap: () {}),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index)
                    {
                      return const ProductCard();
                    }),
              ),
              SectionHeader(title: "New", onTap: () {}),
              SizedBox(
                height: 160,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index)
                    {
                      return const ProductCard();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


