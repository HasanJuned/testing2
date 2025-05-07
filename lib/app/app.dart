import 'package:flutter/material.dart';
import 'package:testing2/presentation/ui/screens/home_screen.dart';


class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}