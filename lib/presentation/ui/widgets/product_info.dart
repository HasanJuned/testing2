import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo(
      {super.key,
        required this.productTitle,
        required this.fontSize,
        required this.fontWeight});

  final String productTitle;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      productTitle,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
