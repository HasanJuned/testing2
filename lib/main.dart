import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RockPaperScissorsGame(),
    );
  }
}

class GameController extends GetxController {
  var choices = ["Rock", "Paper", "Scissors"];
  var userChoice = "".obs;
  var computerChoice = "".obs;
  var result = "".obs;

  void playGame(String choice) {
    userChoice.value = choice;
    computerChoice.value = choices[Random().nextInt(3)];

    if (userChoice.value == computerChoice.value) {
      result.value = "It's a Draw!";
    } else if (
    (userChoice.value == "Rock" && computerChoice.value == "Scissors") ||
        (userChoice.value == "Paper" && computerChoice.value == "Rock") ||
        (userChoice.value == "Scissors" && computerChoice.value == "Paper")) {
      result.value = "You Win!";
    } else {
      result.value = "You Lose!";
    }
  }
}

class RockPaperScissorsGame extends StatelessWidget {
  final GameController controller = Get.put(GameController());

  RockPaperScissorsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rock-Paper-Scissors")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("Your Choice: ${controller.userChoice.value}",
                style: TextStyle(fontSize: 20))),
            const SizedBox(height: 10),
            Obx(() => Text("Computer: ${controller.computerChoice.value}",
                style: TextStyle(fontSize: 20))),
            const SizedBox(height: 20),
            Obx(() => Text(controller.result.value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.choices
                  .map((choice) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => controller.playGame(choice),
                  child: Text(choice),
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
