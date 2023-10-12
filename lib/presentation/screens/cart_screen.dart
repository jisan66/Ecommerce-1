import 'package:ecommerce/presentation/state_holders/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';
import '../widgets/cart_screen_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartListController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<CartListController>(
        builder: (cartListController) {
          if(cartListController.getCartListInProgress){
            return const Center(child: CircularProgressIndicator(),);
          }
          return Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: cartListController.cartListModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return CartScreenCard(cartData: cartListController.cartListModel.data![index]);
                        }),
                  )
                ],
              )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.1),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Price",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$ ${cartListController.totalPrice}',
                          style: const TextStyle(
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
                            "Checkout",
                            style: TextStyle(fontSize: 12),
                          ),
                        ))
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
