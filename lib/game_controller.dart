import 'dart:math';

import 'package:get/get.dart';

class GameController extends GetxController {
  var choices = ['Rock', 'Paper', 'Scissors'];
  var userChoice = ''.obs;
  var computerChoice = ''.obs;
  var result = ''.obs;

  void playGame(String choice) {
    userChoice.value = choice;
    computerChoice.value = choices[Random().nextInt(3)];

    if (userChoice.value == computerChoice.value) {
      result.value = 'Draw';
    } else if ((userChoice.value == "Rock" &&
            computerChoice.value == "Scissors") ||
        (userChoice.value == "Paper" && computerChoice.value == "Rock") ||
        (userChoice.value == "Scissors" && computerChoice.value == "Paper")) {
      result.value = "You Win!";
    } else {
      result.value = 'You Lose!';
    }
  }
}
