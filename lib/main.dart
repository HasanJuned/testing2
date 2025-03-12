import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.yellow)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white
          )
        )
      ),



      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   textTheme: TextTheme(
      //     bodyMedium: TextStyle(color: Colors.green),
      //   ),
      // ),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.yellow, // Button color
      //       foregroundColor: Colors.white, // Text color
      //       textStyle: TextStyle(fontSize: 18),
      //     ),
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   primarySwatch: Colors.red,
      //   brightness: Brightness.dark,
      //   textTheme: TextTheme(
      //     bodyMedium: TextStyle(color: Colors.white),
      //   ),
      // ),
      //themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen 1')),
      body: Column(
        children: [

          Text('Helllo', style: Theme.of(context).textTheme.bodyLarge,),
          Text('Helllo', style: Theme.of(context).textTheme.bodyLarge,),
          Text('Helllo', style: Theme.of(context).textTheme.bodyLarge,),


          ElevatedButton(onPressed: (){}, child: Text('vgfhjikol'),),
          ElevatedButton(onPressed: (){}, child: Text('vgfhjikol')),
          ElevatedButton(onPressed: (){}, child: Text('vgfhjikol')),
          ElevatedButton(onPressed: (){}, child: Text('vgfhjikol')),
          ElevatedButton(onPressed: (){}, child: Text('vgfhjikol')),
          ElevatedButton(onPressed: (){}, child: Text('vgfhjikol')),
          ElevatedButton(onPressed: (){}, child: Text('vgfhjikol')),

        ],
      ),
    );
  }
}
