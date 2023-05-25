import 'package:flutter/material.dart';

import '../pomodoro_model.dart';

class tabScrollView extends StatelessWidget {
  final PomodoroModel model;
  const tabScrollView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 240),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        selectableTimes.length,
        (index) => InkWell(
          onTap: () {
            double seconds = double.parse(selectableTimes[index]);
            model.selectTime(seconds);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            width: 70,
            height: 50,
            decoration: int.parse(selectableTimes[index]) == model.selectedTime
                ? BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(5))
                : BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white30),
                    borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                (int.parse(selectableTimes[index]) ~/ 60).toString(),
                style: TextStyle(
                    color:
                        int.parse(selectableTimes[index]) == model.selectedTime
                            ? renderColor(model.currentState)
                            : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
            ),
          ),
        ),
      )),
    );
  }
}

List selectableTimes = [
  '0',
  '300',
  '600',
  '900',
  '1200',
  '1500',
  '1800',
  '2100',
  '2400',
  '2700',
  '3000',
  '3300',
];

Color renderColor(String currentstate) {
  if (currentstate == 'Focus') {
    return Colors.redAccent;
  } else {
    return Colors.lightBlueAccent;
  }
}
