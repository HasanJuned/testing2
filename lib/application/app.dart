import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/home_screen.dart';
import 'binders.dart';



class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GetXBindings(),
      home:  MyApp(),
    );
  }
}
