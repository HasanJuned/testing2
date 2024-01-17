import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing2/splash_screen.dart';


void main() {
  runApp(TechStore());
}

class TechStore extends StatelessWidget {
  const TechStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
