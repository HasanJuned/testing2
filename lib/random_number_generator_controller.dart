import 'dart:math';
import 'package:get/get.dart';

class RandomNumberGeneratorController extends GetxController {
  var randomNumber = 0.obs;

  void generateLotteryNumber() {
    randomNumber.value = Random().nextInt(100) + 1; // Generates a number between 1 and 100
  }
}
