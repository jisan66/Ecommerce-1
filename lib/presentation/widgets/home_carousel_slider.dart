import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import '../../data/models/slider_data.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> sliderData;
  const HomeSlider({super.key, required this.sliderData});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlide = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              height: 180.0,
              onPageChanged: (int page, _) {
                _selectedSlide.value = page;
              }),
          items: widget.sliderData.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:
                        BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(10)),
                    child: Image.network(sliderData.image ?? ""));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _selectedSlide,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < widget.sliderData.length; i++) {
                list.add(Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                      color: value == i
                          ? AppColors.primaryColor
                          : Colors.grey.shade200),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            })
      ],
    );
  }
}
