import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ElevatedButton(onPressed: (){

            showDialog(context: context, builder: (context){

              return AlertDialog(
                title: Text('Warning'),
                content: Text('Are you sure for confirmation'),
                actions: [
                  TextButton(onPressed: (){

                  }, child: Text('No')),
                  TextButton(onPressed: (){


                  }, child: Text('Yes')),
                ],
              );


            });


          }, child: Text('Submit'),)



        ),
      ),
    );
  }
}
