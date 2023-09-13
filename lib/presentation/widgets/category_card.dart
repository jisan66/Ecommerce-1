import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 17),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.emoji_food_beverage_outlined,
            size: 32,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Electronics',
          style: TextStyle(
              fontSize: 15,
              color: AppColors.primaryColor,
              letterSpacing: 0.4),
        )
      ],
    );
  }
}
