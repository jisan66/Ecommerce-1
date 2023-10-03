import 'package:ecommerce/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:ecommerce/presentation/widgets/custom_stepper.dart';
import 'package:ecommerce/presentation/widgets/product_details_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> color = [
    Colors.black,
    Colors.lightBlueAccent,
    Colors.brown,
    Colors.lightGreenAccent,
    Colors.grey
  ];

  List<String> size = ['X', 'XL', '2L', 'L'];

  int _selectedColor= 0;
  late int _selectedSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productDetailsAppBar,
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          return Column(
            children: [
              ProductImageSlider(
                imageList: [productDetailsController.productDetails.img1 ?? "",
                  productDetailsController.productDetails.img2 ?? "",
                  productDetailsController.productDetails.img3 ?? "",
                  productDetailsController.productDetails.img4 ?? ""],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: productDetails,
                ),
              ),
              cartToCartBottomContainer
            ],
          );
        }
      ),
    );
  }

  Padding get productDetails {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                          child: Text(
                        "New Year Adidas Special Shoe 30 WXYZ225",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      )),
                      CustomStepper(
                          lowerLimit: 1,
                          upperLimit: 10,
                          stepValue: 1,
                          value: 1,
                          onChange: (value) {
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text("4.5",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Reviews",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Card(
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "Color",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 25,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: color.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _selectedColor = index;
                              if(mounted) {
                                setState(() {});
                              }
                            },
                            child: CircleAvatar(
                                backgroundColor: color[index],
                                child: _selectedColor == index
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    : null),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Size",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 30,
                    child: SizePicker(size: size, onSelected: (int selectedIndex){
                      _selectedSize = selectedIndex;
                    }, initialSelected: 0  ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Description",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                      'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure')
                ],
              ),
            );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: AppColors.primaryColor,
      ),
      title: const Text(
        "Product Details",
        style: TextStyle(color: AppColors.primaryColor),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Container get cartToCartBottomContainer {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.1),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "\$1,000",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(fontSize: 12),
                    ),
                  ))
            ],
          ),
        );
  }
}

