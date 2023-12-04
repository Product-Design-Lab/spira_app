import 'package:flutter/material.dart';

import 'package:spira/model/lesson.dart';
import 'package:spira/widgets/measure.dart';

class TimedGameView extends StatefulWidget {
  final int breathLevel;
  final Lesson lesson;

  const TimedGameView(
      {Key? key, required this.breathLevel, required this.lesson})
      : super(key: key);

  @override
  State<TimedGameView> createState() => _TimedGameViewState();
}

class _TimedGameViewState extends State<TimedGameView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: MeasureView(level: widget.breathLevel)),
      ],
    );
  }
}
