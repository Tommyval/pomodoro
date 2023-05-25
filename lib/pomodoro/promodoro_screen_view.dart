import 'package:flutter/material.dart';
import 'package:pomodoro/pomodoro/pomodoro_model.dart';
import 'package:pomodoro/pomodoro/widgets/progresswidget.dart';
import 'package:pomodoro/pomodoro/widgets/timeController.dart';
import 'package:pomodoro/pomodoro/widgets/timercard.dart';
import 'package:pomodoro/pomodoro/widgets/timeroptions.dart';
import 'package:stacked/stacked.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PomodoroModel>.reactive(
      viewModelBuilder: () => PomodoroModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: renderColor(viewModel.currentState),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: renderColor(viewModel.currentState),
            title: const Text(
              'POMOTIMER',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  viewModel.reset();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                TimeCard(
                  model: viewModel,
                ),
                const SizedBox(
                  height: 40,
                ),
                tabScrollView(model: viewModel),
                const SizedBox(
                  height: 40,
                ),
                TimeController(
                  model: viewModel,
                ),
                const SizedBox(
                  height: 30,
                ),
                ProgressWidget(
                  model: viewModel,
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
