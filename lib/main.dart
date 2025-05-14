import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalPrice = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  sslEcom();
                },
                child: Text('SSL ecommerz'))
          ],
        ),
      ),
    );
  }

  void sslEcom() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: "ostad6824b3be647db",
        store_passwd: "ostad6824b3be647db@ssl",
        total_amount: totalPrice,
        tran_id: "custom_transaction_idX001",
      ),
    );

    final response = await sslcommerz.payNow();

    if (response.status == 'VALID') {
      print('Payment success: ${response.tranId}');
      print(response.tranDate);
    }
    if (response.status == 'Closed') {
      print('Payment Closed');
    }
    if (response.status == 'FAILED') {
      print('Payment Failed');
    }
  }
}
