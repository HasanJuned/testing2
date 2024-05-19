import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/presentation/ui/state_holders/auth_controller.dart';
import 'auth/login_screen.dart';
import 'auth/sign_up_screen.dart';
import 'my_dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    print(AuthController.getAccessToken());
  }

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
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/images/course_banner.png'),
            ),
            SizedBox(
              height: 5,
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
                onPressed: () async {
                  final result = await AuthController.checkLoginState();

                  if (result) {
                    showDialog(
                        context: (context),
                        builder: (builder) {
                          return AlertDialog(
                            title: const Text('Warning'),
                            content: const Text(
                                'Thank you for your interest. We receive payment via call or WhatsApp. Please provide your phone / WhatsApp number so that we will contact you for payment'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel')),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: (context),
                                      builder: (builder) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'Number'),
                                              ),
                                              TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'Full Name'),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel')),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Knock Me'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: const Text('Next'),
                              ),
                            ],
                          );
                        });
                  } else {
                    Get.offAll(const SignUpScreen());
                  }
                },
                child: const Text('Enroll Now'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              tileColor: Colors.grey.shade300,
              leading: Icon(Icons.person_2_outlined),
              trailing: Text(
                'Instructor',
                style: TextStyle(fontSize: 16),
              ),
              title: Text(
                'Hasan Ahmed',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              subtitle: Text('Flutter Developer'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .1,
                    ),
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.brown,
                        width: 1.5)),
                onPressed: () {
                  if (AuthController.isPaid0 == '1') {
                    Get.to(() => const MyDashboardScreen());
                  } else {
                    Get.snackbar(
                        'You have no any enrolled course', 'Take a course?',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.yellow);
                  }
                },
                child: const Text('My Course'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
