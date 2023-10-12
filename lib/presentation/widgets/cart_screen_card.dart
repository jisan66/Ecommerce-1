import 'package:ecommerce/presentation/state_holders/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/car_list_model.dart';
import '../utility/app_colors.dart';
import '../utility/image_assets.dart';
import 'custom_stepper.dart';

class CartScreenCard extends StatelessWidget {
  final CartData cartData;
  const CartScreenCard({
    super.key, required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image:
                DecorationImage(image: AssetImage(ImageAssets.shoeImage))),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartData.product?.title ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black87.withOpacity(.7)),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(color: Colors.black45),
                                      children: [
                                        TextSpan(text: "Color: ${cartData.color}"),
                                        TextSpan(text: "Size: ${cartData.size}")
                                      ]))
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: Colors.black54,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "\$100",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor),
                        ),
                        CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 20,
                            stepValue: 1,
                            value: cartData.numberOfProducts,
                            onChange: (int value) {
                              Get.find<CartListController>().changeNumberOfProduct(cartData.id!, value);
                            })
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
