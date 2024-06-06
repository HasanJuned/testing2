import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../modal/productModal.dart';
import '../style/style.dart';

class createFormScreen extends StatefulWidget {
  const createFormScreen({super.key});


  @override
  State<createFormScreen> createState() => _createFormScreenState();
}

class _createFormScreenState extends State<createFormScreen> {

  TextEditingController productNamecontroller =TextEditingController();
  TextEditingController productCodecontroller =TextEditingController();
  TextEditingController unitPricecontroller =TextEditingController();
  TextEditingController qtycontroller =TextEditingController();
  TextEditingController totalPicecontroller =TextEditingController();
  TextEditingController imageurlcontroller =TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>() ;

  bool creatingProduct=false;

  @override
  void dispose() {
    productCodecontroller.dispose();
    productNamecontroller.dispose();
    unitPricecontroller.dispose();
    qtycontroller.dispose();
    totalPicecontroller.dispose();
    imageurlcontroller.dispose();
    super.dispose();
  }

  Future<void> createProduct() async{
    creatingProduct=true;
    setState(() {});
    String createProductUrl="https://crud.teamrabbil.com/api/v1/CreateProduct";
    Uri createProductUri=Uri.parse(createProductUrl);

    //prepare data
    Map<String, dynamic> inputData={
      "Img": imageurlcontroller.text.trim(),
      "ProductCode": productCodecontroller.text,
      "ProductName": productNamecontroller.text,
      "Qty": qtycontroller.text,
      "TotalPrice": totalPicecontroller.text,
      "UnitPrice": unitPricecontroller.text
    };

    var encodeData=jsonEncode(inputData);

    Response response =await post(createProductUri,
    body:encodeData,
    headers: {'content-type': 'application/json'},
    );
    var code=response.statusCode;
    var body=response.body;
    print(code);
    print(body);

    if(code==200){
      clearForm();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New product added!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add new product failed! Try again.')),
      );
    }

    creatingProduct=false;
    setState(() {});
  }

  void clearForm() {
    productNamecontroller.clear();
    productCodecontroller.clear();
    unitPricecontroller.clear();
    qtycontroller.clear();
    totalPicecontroller.clear();
    imageurlcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create A product"),
        centerTitle: true,
        backgroundColor: tealColor,
        foregroundColor: whiteColor,
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child:Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: productNamecontroller,
                decoration: formStyle("Product Name"),
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value==null || value.trim().isEmpty){
                    return "Please write Your Product name";
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: productCodecontroller,
                decoration: formStyle("Product Code"),
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value==null || value.trim().isEmpty){
                    return "Please write Your Product name";
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: unitPricecontroller,
                decoration: formStyle("Unit Price"),
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value==null || value.trim().isEmpty){
                    return "Please write Your Product name";
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: qtycontroller,
                decoration: formStyle("Quantity"),
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value==null || value.trim().isEmpty){
                    return "Please write Your Product name";
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: totalPicecontroller,
                decoration: formStyle("Total Price"),
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value==null || value.trim().isEmpty){
                    return "Please write Your Product name";
                  }
                },
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: imageurlcontroller,
                decoration: formStyle("Image Url"),
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value==null || value.trim().isEmpty){
                    return "Please write Your Product name";
                  }
                },
              ),
              const SizedBox(height: 20,),
              Visibility(
                visible: creatingProduct==false,
                replacement: const Center(child: CircularProgressIndicator()),
                child: ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      createProduct();
                    }
                  },
                  style:ElevatedButton.styleFrom(
                    backgroundColor: tealColor,
                    foregroundColor: whiteColor,
                    fixedSize: const Size.fromWidth(double.maxFinite),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                    child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
