import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/presentation/state_holders/products_list_controller.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen(
      {super.key,
      this.categoryId,
      this.productModel,
      required this.appBarName});

  final int? categoryId;
  final ProductModel? productModel;
  final String appBarName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.productModel == null) {
        Get.find<ProductsListController>()
            .getProductsByCategory(widget.categoryId!);
      } else if (widget.categoryId == null) {
        Get.find<ProductsListController>().setModel(widget.productModel!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appBarName,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: AppColors.primaryColor,
        ),
      ),
      body: GetBuilder<ProductsListController>(
          builder: (productListController) {
            if (productListController.getProductListInProgress) {
              return (const Center(child: CircularProgressIndicator()));
            }
            if(productListController.productModel.data?.isEmpty ?? true){
              return const Center(child: Text("Empty List",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColors.primaryColor),),);
            }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 8),
              itemCount:
                  productListController.productModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return FittedBox(
                    child: ProductCard(
                  productData:
                      productListController.productModel.data![index],
                ));
              }),
        );
      }),
    );
  }
}
