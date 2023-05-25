import 'package:flutter/material.dart';

import 'package:pomodoro/pomodoro/pomodoro_model.dart';
import 'package:pomodoro/pomodoro/widgets/timeroptions.dart';

class TimeCard extends StatelessWidget {
  const TimeCard({super.key, required this.model});
  final PomodoroModel model;
  @override
  Widget build(BuildContext context) {
    final seconds = model.currentDuration % 60;
    return Column(
      children: [
        Text(
          model.currentState,
          style: const TextStyle(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              child: Center(
                child: Text(
                  (model.currentDuration ~/ 60).toString(),
                  style: TextStyle(
                      fontSize: 70,
                      color: renderColor(model.currentState),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ':',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.red[200],
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              child: Center(
                child: Text(
                  seconds == 0
                      ? '${seconds.round()}0'
                      : seconds.round().toString(),
                  style: TextStyle(
                      fontSize: 70,
                      color: renderColor(model.currentState),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
