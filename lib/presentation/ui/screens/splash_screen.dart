import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/presentation/ui/screens/auth/login_screen.dart';
import 'package:testing2/presentation/ui/screens/home_screen.dart';

import '../state_holders/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAuthState();
  }

  void checkUserAuthState() async {
    final result = await AuthController.checkLoginState();
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      if (result) {
        print(result);
        Get.offAll(const HomeScreen());
      } else {
        Get.offAll(const HomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Wait')),
    );
  }
}
