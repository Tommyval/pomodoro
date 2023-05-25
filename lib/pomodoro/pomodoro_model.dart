import 'dart:async';

import 'package:stacked/stacked.dart';

class PomodoroModel extends BaseViewModel {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = 'Focus';
  void start() {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    currentDuration = seconds;
    selectedTime = seconds;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = 'Focus';
    currentDuration = selectedTime = 1500;
    rounds = goal = 0;
    timerPlaying = false;
  }

  void handleNextRound() {
    if (currentState == 'Focus' && rounds != 3) {
      currentState = 'Break';
      currentDuration = 5;
      selectedTime = 5;
      rounds++;
      goal++;
    } else if (currentState == 'Break') {
      currentState = 'Focus';
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentState == 'Focus' && rounds == 3) {
      currentState = 'LongBreak';
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goal++;
    } else if (currentState == 'LongBreak') {
      currentState = 'Focus';
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }
}
