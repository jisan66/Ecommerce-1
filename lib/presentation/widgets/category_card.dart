import 'package:ecommerce/data/models/category_data.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryData});
  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(categoryData.categoryImg ?? '',height: 80,),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          categoryData.categoryName ?? "",
          style: const TextStyle(
              fontSize: 15,
              color: AppColors.primaryColor,
              letterSpacing: 0.4),
        )
      ],
    );
  }
}
