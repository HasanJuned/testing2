import 'dart:math';
import 'package:get/get.dart';

class RandomNumberGeneratorController extends GetxController {
  double randomNumber = 0;

  void generateLotteryNumber() {
    randomNumber = Random().nextInt(100) + 1;
    update();
  }
}
