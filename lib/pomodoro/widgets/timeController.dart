import 'package:flutter/material.dart';
import 'package:pomodoro/pomodoro/pomodoro_model.dart';
import 'package:stacked/stacked.dart';

class TimeController extends StatelessWidget {
  const TimeController({super.key, required this.model});
  final PomodoroModel model;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PomodoroModel>.reactive(
      viewModelBuilder: () => PomodoroModel(),
      builder: (context, viewModel, child) {
        return Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              color: Colors.black26, shape: BoxShape.circle),
          child: Center(
              child: IconButton(
            icon: model.timerPlaying
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow_sharp),
            onPressed: () {
              model.timerPlaying ? model.pause() : model.start();
            },
            iconSize: 55,
            color: Colors.white,
          )),
        );
      },
    );
  }
}
