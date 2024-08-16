import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {super.key,
      required this.onchange,
      required this.sizes,
      this.isRounded = true});
  final List<String> sizes;
  final Function(String) onchange;
  final bool isRounded;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              widget.onchange(widget.sizes[index]);
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 40,
              width: widget.isRounded ? 40 : null,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _getSelectedSizeBackgroundColor(index == selectedIndex),
                borderRadius: BorderRadius.circular(widget.isRounded ? 100 : 8),
                border: Border.all(
                  color: _getSelectedSizeTextColor(index == selectedIndex),
                ),
              ),
              child: FittedBox(
                child: Text(
                  widget.sizes[index],
                  style: TextStyle(
                    color: _getSelectedSizeTextColor(index == selectedIndex),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getSelectedSizeTextColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }

  Color _getSelectedSizeBackgroundColor(bool isSelected) {
    return isSelected ? AppColors.primaryColor : Colors.transparent;
  }
}
