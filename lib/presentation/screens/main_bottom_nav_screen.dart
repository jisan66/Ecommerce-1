import 'package:ecommerce/presentation/screens/category_screen.dart';
import 'package:ecommerce/presentation/screens/home_screen.dart';
import 'package:ecommerce/presentation/screens/wish_list_screen.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int _selectedIndex = 0;

  final List<Widget> _screens =
      const [
        HomeScreen(),
        CategoryScreen(),
        HomeScreen(),
        WishListScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey.shade600,
        selectedItemColor: AppColors.primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 4,
        onTap: (int index){
          _selectedIndex = index;
          if(mounted)
            {setState(() {});}
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: "Wish"),
        ],
        
      ),
    );
  }
}
