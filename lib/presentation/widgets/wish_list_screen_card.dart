import 'package:ecommerce/data/models/wish_list_model.dart';
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
import '../utility/image_assets.dart';

class WishListScreenCard extends StatelessWidget {
  final WishListData wishListData;
  const WishListScreenCard({
    super.key, required this.wishListData,
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
                                wishListData.product?.title ?? "",
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
                                        TextSpan(text: "Created At: ${wishListData.createdAt}\n"),
                                        TextSpan(text: "Updated At: ${wishListData.updatedAt}")
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$100",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor),
                        ),
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
