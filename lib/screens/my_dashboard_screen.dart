import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'video_screen.dart';

class MyDashboardScreen extends StatelessWidget {
  const MyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 100,
        title: const Text(
          'Flutter Course',
          style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: .1),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/course_banner.png'),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .1),
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.brown,
                          width: 1.5)),
                  onPressed: () {
                    Get.to(()=> const VideoScreen());
                  },
                  child: const Text('Enter'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

