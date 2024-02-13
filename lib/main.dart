import 'package:flutter/material.dart';


/// navigator -> push, pop, pushAndRemoveUntil

void main(){  // code er entry point
  runApp(MyApp()); // application entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: Text('1st Screen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              /// ek screen teke onno screen ey niye jawa
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondScreen()));

            }, child: Text('goto 2nd screen'))
          ],
        ),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2nd Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){

              // jekan teke present screen call hoise, shekane niye jabe
              Navigator.pop(context); ///  screen teke back kora

            }, child: Text('Back 1st screen')),

            ElevatedButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdScreen()));

            }, child: Text('goto 3rd screen')),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3rd screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){

              // purber sob screen memory / stack teke remove kore memory / stack free kore dia and apni jei screen ey jabar kota bolben shei screen ey niye jave
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false);

            }, child: Text('Goto 1st Screen'))
          ],
        ),
      ),
    );
  }
}



