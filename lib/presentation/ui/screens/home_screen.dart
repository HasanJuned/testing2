import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testing2/data/model/product_model.dart';
import 'package:testing2/presentation/ui/screens/add_product_screen.dart';
import 'package:testing2/presentation/ui/screens/product_details_screen.dart';
import 'package:testing2/presentation/ui/widgets/product_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Client http = Client();
  ProductModel productModel = ProductModel();
  bool inProgress = false;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productQtyController = TextEditingController();
  final TextEditingController _productUnitPriceController = TextEditingController();
  final TextEditingController _productTotalPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  void getAllProducts() async{

    inProgress = true;
    setState(() {

    });

    /// step 1
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/ReadProduct');

    /// step 2
    Response response = await http.get(uri); /// yes/no


    /// step 3
    productModel = ProductModel.fromJson(jsonDecode(response.body));

    inProgress = false;
    setState(() {

    });



  }

  /// 456
  void deleteProduct(String id) async{

    inProgress = true;
    setState(() {

    });

    /// step 1
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/DeleteProduct/$id');

    /// step 2
    Response response = await http.get(uri); /// yes/no


    /// step 3
    productModel = ProductModel.fromJson(jsonDecode(response.body));

    inProgress = false;
    setState(() {

    });



  }

  // 45
  void updateProduct(String id) async {
    inProgress = true;
    setState(() {});

    /// step 1
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/UpdateProduct/$id');

    /// step 2
    Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "ProductName": _productNameController.text.toString(),
          "ProductCode": int.parse(_productCodeController.text).toInt(),
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
        content: Text('Updated Successfully'),
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
        title: Text('Todo'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: inProgress == true ? Center(child: CircularProgressIndicator()): ListView.builder(
            itemCount: productModel.data?.length,
            itemBuilder: (context, index){
          return SizedBox(
            height: 350,
            width: double.infinity,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsScreen(id: productModel.data![index].sId.toString(),)));
              },
              child: Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductInfo(productTitle: 'Product Name: ${productModel.data?[index].productName}', fontSize: 24, fontWeight: FontWeight.w700),
                      ProductInfo(productTitle: 'Product Code: ${productModel.data?[index].productCode}', fontSize: 18, fontWeight: FontWeight.w700),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){

                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text('Update Product Details'),
                                content: SingleChildScrollView(
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

                                        updateProduct(productModel.data![index].sId.toString());
                                        getAllProducts();
                                        Navigator.pop(context);


                                      }, child: const Text('Update Product'))
                                    ],
                                  ),
                                ),
                              );
                            });

                          }, icon: Icon(Icons.edit)),
                          const SizedBox(width: 4,),
                          IconButton(
                              onPressed: (){

                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text('Are you sure for delete?'),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,

                                      children: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text('No')),
                                        TextButton(onPressed: (){

                                          deleteProduct(productModel.data![index].sId.toString());
                                          getAllProducts();
                                          Navigator.pop(context);


                                        }, child: Text('Yes')),
                                      ],
                                    ),
                                  );
                                });


                              }, icon: Icon(Icons.delete)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProductScreen()));

        },
      ),
    );
  }
}

