import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/presentation/ui/screens/home_screen.dart';

import 'binders.dart';


class FlutterCourse extends StatelessWidget {
  const FlutterCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GetXBindings(),
      home: const HomeScreen(),
    );
  }
}
