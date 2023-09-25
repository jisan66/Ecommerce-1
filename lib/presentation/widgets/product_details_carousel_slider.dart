import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedSlide = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              height: 260.0,
              viewportFraction: 1,
              onPageChanged: (int page, _) {
                _selectedSlide.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration:
                         BoxDecoration(color: Colors.grey.shade200),
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: ValueListenableBuilder(
              valueListenable: _selectedSlide,
              builder: (context, value, _) {
                List<Widget> list = [];
                for (int i = 0; i < 5; i++) {
                  list.add(Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(

                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: value == i
                            ? AppColors.primaryColor
                            : Colors.transparent),
                  ));
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
        )
      ],

    );
  }
}
