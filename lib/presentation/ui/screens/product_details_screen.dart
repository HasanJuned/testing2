import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testing2/presentation/ui/widgets/product_info.dart';

import '../../../data/model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  Client http = Client();
  ProductModel productModel = ProductModel();
  bool inProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readOneProduct();
  }


  void readOneProduct() async{

    inProgress = true;
    setState(() {

    });

    /// step 1
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/ReadProductById/${widget.id}');

    /// step 2
    Response response = await http.get(uri); /// yes/no


    /// step 3
    productModel = ProductModel.fromJson(jsonDecode(response.body));

    inProgress = false;
    setState(() {

    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: inProgress == true ? CircularProgressIndicator() : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Product Name: ${productModel.data!.first.productName.toString
            ()}'),
            Text(productModel.data!.first.productCode.toString()),
            Text(productModel.data!.first.img.toString()),
            Text(productModel.data!.first.qty.toString()),
            Text(productModel.data!.first.unitPrice.toString()),
            Text(productModel.data!.first.totalPrice.toString()),


          ],
        ),
      ),
    );
  }
}
