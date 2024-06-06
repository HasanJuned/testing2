import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../modal/productModal.dart';
import '../style/style.dart';
import 'createformScreen.dart';
int count=1;
class ProductListView extends StatefulWidget {



  ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  bool productListComing=false;
  List<ProductModal> productList=[];


  @override
  void initState() {
    super.initState();
    getProduct();
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Product List"),
        centerTitle: true,
        backgroundColor: tealColor,
        foregroundColor: whiteColor,
      ),
      body: RefreshIndicator(
        //it will get the new data bu calling Rest API
        onRefresh:getProduct,
        child: Visibility(
            visible: productListComing==false,
            replacement:const Center(
              child: CircularProgressIndicator(),
            ) ,
            child:ListView.separated(
              itemCount: productList.length,
              itemBuilder: (context,index){
                //getProduct();
                //it will show the products in list.so we have to design out listTile here
                return listTileDesign(productList[index]);
              },
              separatorBuilder:(_,__)=>const Divider(),

            )
        ),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(count++);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>createFormScreen(),
              )
          );
        },
        foregroundColor:whiteColor,
        backgroundColor:tealColor,
        child:const Icon(Icons.add),
      ),
    );
  }

  Widget listTileDesign(ProductModal product){
    return  ListTile(
      // leading: product.img != null
      //     ? Image.network(product.img!)
      //     : Text("Image Not Found"),
      title: Text(product.productName ??"Unknown"),
      subtitle:  Wrap(
        children: [
          Text("Unit Price : ${product.unitPrice}/-"),
          Text("Quantity:${product.quantity}/-"),
          Text("Total Price:${product.totalPrice}/-"),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: (){
              final result= Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => createFormScreen()));
              if(result==true){
                getProduct();
              }

            },
          ),
          IconButton(
            onPressed:(){
              if (product.productCode != null) {
                _showDeleteConfirmationDialog(product.productCode!);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Product ID is missing. Cannot delete this product.')),
                );
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),

    );
  }

  Future<void> getProduct() async{
    productListComing=true;
    setState(() {});

    productList.clear();

    const String productListUrl="https://crud.teamrabbil.com/api/v1/ReadProduct";
    Uri productListUri=Uri.parse(productListUrl);
    Response response =await get(productListUri);  // here we have to add http dependencies
    var code=response.statusCode;
    var body=response.body;
    print(code);
    print(body);
    //step 1 => data decode
    //step 2 => get the list
    //step 3 loop over the list we got in step 2 to add the data


    if(code==200){
      final decodeData=jsonDecode(body);
      final jsonProductList=decodeData['data'];
      for(Map<String,dynamic> item in jsonProductList){
        ProductModal product = ProductModal.fromJson(item);
        // productModal product=productModal(
        //     productName: item['ProductName']??'',
        //     productCode: item['ProductCode']??'',
        //     img: item['Img'],
        //     unitPrice: item['unitPrice'],
        //     qty: item['Qty'],
        //     totalPrice: item['TotalPrice'],
        //     productId: item['_id']
        // );
        productList.add(product);
      }
      print("get succesfully");
    } else {
      print("Get product list failed! Try again.");
    }
    productListComing=false;
    setState(() {});
  }

  Future<void> deleteProduct(String productId) async{
    productListComing=true;
    setState(() {

    });
    String deleteProductUrl="https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId";
    Uri deleteProductUri=Uri.parse(deleteProductUrl);
    Response response =await get(deleteProductUri);
    var code=response.statusCode;
    var body=response.body;
    print(code);
    print(body);
    if(response==200){
      getProduct();
      print("delete successfully");
    } else {
      productListComing = false;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Delete product failed! Try again.')),
      );
    }
  }

  void _showDeleteConfirmationDialog(String productId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure that you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteProduct(productId);
                Navigator.pop(context);
              },
              child: const Text('Yes, delete'),
            ),
          ],
        );
      },
    );
  }



}




























