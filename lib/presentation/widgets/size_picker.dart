import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onSelected, required this.initialSelected});
  final List<String> size;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  int _selectedSize = 0;

  @override
  void initState() {
    _selectedSize = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.size.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _selectedSize = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                Border.all(color: Colors.grey),
                color: _selectedSize == index
                    ? AppColors.primaryColor
                    : Colors.transparent),
            child: Text(
              widget.size[index],
              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,
                  color: _selectedSize == index
                      ? Colors.white
                      : Colors.grey),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 16,
        );
      },
    );
  }
}
