import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onchange});
  final List<Color> colors;
  final Function(Color) onchange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              widget.onchange(widget.colors[index]);
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: widget.colors[index],
              child: selectedIndex == index
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
