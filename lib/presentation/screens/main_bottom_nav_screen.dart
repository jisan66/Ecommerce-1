import 'package:ecommerce/presentation/screens/category_screen.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:ecommerce/presentation/screens/wish_list_screen.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_holders/main_bottom_nav_controller.dart';
import 'cart_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final List<Widget> _screens =
      const [
        HomeScreen(),
        CategoryScreen(),
        CartScreen(),
        WishListScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body:_screens[controller.currentScreen],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentScreen,
            unselectedItemColor: Colors.grey.shade600,
            selectedItemColor: AppColors.primaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 4,
            onTap: controller.changeScreen,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: "Wish"),
            ],

          ),
        );
      }
    );
  }
}
