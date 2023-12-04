import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:spira/constants/button_styles.dart';
import 'package:spira/constants/text_styles.dart';
import 'package:spira/constants/colors.dart';

import 'package:spira/model/device.dart';
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
  Timer? _timer;

  LessonState state = LessonState.ready;

  int sequence = 0;
  int elapsedTime = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void updateGameSequence() {
    if ((sequence < widget.lesson.sequence.length - 1) ||
        (state != LessonState.complete)) {
      setState(() {
        sequence++;
        state = widget.lesson.sequence[sequence];
      });
    }
  }

  void startPressed() {
    updateGameSequence();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime++;

        if (elapsedTime >= widget.lesson.maxInterval) {
          _timer?.cancel();
          updateGameSequence();
        }
        ;
      });
    });
  }

  void restartPressed() {
    _timer?.cancel();
    setState(() {
      sequence = 0;
      elapsedTime = 0;
      state = widget.lesson.sequence[0];
    });
  }

  void exit() {
    Navigator.pop(context);
  }

  void openSurvey() async {
    Uri url = Uri.parse(Device.surveyURL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  String promptText() {
    switch (state) {
      case LessonState.ready:
        return widget.lesson.title;
      case LessonState.complete:
        return "Nice work!";
      default:
        return state.prompt;
    }
  }

  Widget controls() {
    switch (state) {
      case LessonState.ready:
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: startPressed,
                  style: ButtonStyles.buttonGreen,
                  child: const Text("Start")),
            )
          ],
        );
      case LessonState.complete:
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: exit,
                  style: ButtonStyles.buttonDefault,
                  child: const Text("Done")),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: openSurvey,
                  style: ButtonStyles.buttonYellow,
                  child: const Text("Rate")),
            )
          ],
        );
      default:
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: restartPressed,
                  style: ButtonStyles.buttonRed,
                  child: const Text("Stop")),
            )
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text('$elapsedTime')),
        Center(child: MeasureView(state: state, level: widget.breathLevel)),
        Center(
          child: Text(promptText(),
              style: TextStyles.body.copyWith(color: AppColors.labelPrimary)),
        ),
        controls(),
      ],
    );
  }
}
