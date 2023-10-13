import 'package:ecommerce/presentation/state_holders/wish_list_controller.dart';
import 'package:ecommerce/presentation/widgets/wish_list_screen_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_holders/main_bottom_nav_controller.dart';
import '../utility/app_colors.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishListController>().getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "WishList",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: GetBuilder<WishListController>(
            builder: (wishListController) {
              if(wishListController.getWishListInProgress){
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
                                itemCount: wishListController.wishListModel.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return WishListScreenCard(wishListData: wishListController.wishListModel.data![index]);
                                }),
                          )
                        ],
                      )),

                ],
              );
            }
        ),
      ),
    );
  }
}
