import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'random_number_generator_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LotteryView(),
    );
  }
}

class LotteryView extends StatelessWidget {
  LotteryView({super.key});

  final RandomNumberGeneratorController _randomNumberGeneratorController = Get.put(RandomNumberGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottery App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Your Lottery Number: ${_randomNumberGeneratorController.randomNumber.value}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _randomNumberGeneratorController.generateLotteryNumber,
              child: const Text('Generate Lottery Number'),
            ),
          ],
        ),
      ),
    );
  }
}
