import 'dart:async';
import 'package:get/get.dart';

class OtpCounterController extends GetxController {
  final _remainingTime = 100.obs;
  final _isResendEnabled = false.obs;
  late Timer _timer;

  int get remainingTime => _remainingTime.value;
  bool get isResendEnabled => _isResendEnabled.value;

  void startTimer() {
    _isResendEnabled.value = false;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingTime.value != 0) {
          _remainingTime.value--;
        } else {
          _isResendEnabled.value = true;
          _timer.cancel();
        }
      },
    );
  }

  void resendCode() {
    _remainingTime.value = 100;
    _isResendEnabled.value = false;
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
