import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../data/model/product_model.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Client http = Client();
  bool inProgress = false;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productQtyController = TextEditingController();
  final TextEditingController _productUnitPriceController =
      TextEditingController();
  final TextEditingController _productTotalPriceController =
      TextEditingController();

  void addProduct() async {
    inProgress = true;
    setState(() {});

    /// step 1
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');

    /// step 2
    Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "ProductName": _productNameController.text.toString(),
          "ProductCode": int.parse(_productCodeController.text),
          "Img": _productImageController.text.toString(),
          "Qty": int.parse(_productQtyController.text),
          "UnitPrice": int.parse(_productUnitPriceController.text),
          "TotalPrice": int.parse(_productTotalPriceController.text)
        }));

    /// step 3

    print(response.body);

    final responseJson = jsonDecode(response.body);
    inProgress = false;
    setState(() {});

    if (responseJson['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Created Successfully'),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed'),
        backgroundColor: Colors.redAccent,
      ));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(
                    hintText: 'Product Name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _productCodeController,
                decoration: const InputDecoration(
                    hintText: 'Product Code', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _productImageController,
                decoration: const InputDecoration(
                    hintText: 'Image', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _productQtyController,
                decoration: const InputDecoration(
                    hintText: 'Qty', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _productUnitPriceController,
                decoration: const InputDecoration(
                    hintText: 'Unit Price', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _productTotalPriceController,
                decoration: const InputDecoration(
                    hintText: 'Total Price', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(onPressed: () {
                addProduct();
              }, child: const Text('Add Product'))
            ],
          ),
        ),
      ),
    );
  }
}
