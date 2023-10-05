import 'package:ecommerce/presentation/state_holders/products_by_category_controller.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryId});
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductsByCategoryController>().getProductsByCategory(widget.categoryId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products",style: TextStyle(color: AppColors.primaryColor),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: AppColors.primaryColor,
           ),
      ),
      body: GetBuilder<ProductsByCategoryController>(
          builder: (productsByCategoryController) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 8),
                  itemCount: productsByCategoryController.productModel.data?.length ?? 0,
                  itemBuilder: (context, index){
                    return FittedBox(child: ProductCard(productData: productsByCategoryController.productModel.data![index],
                    ));
                  }),
            );
          }
        ),
    );
  }
}
