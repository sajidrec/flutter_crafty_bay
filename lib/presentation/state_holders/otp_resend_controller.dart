import 'dart:async';

import 'package:get/get.dart';

class OtpResendController extends GetxController {
  int _currentTimerTime = 100;

  int get getCurrentTimerTime => _currentTimerTime;

  Future<void> startTheTimer({required int initialTime}) async {
    _currentTimerTime = initialTime;

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _currentTimerTime--;
        update();
        if (_currentTimerTime <= 0) {
          timer.cancel();
        }
      },
    );
  }
}
