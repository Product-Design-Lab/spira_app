import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:spira/constants.dart';
import 'package:spira/model/device.dart';
import 'package:spira/model/lesson.dart';

import 'package:spira/widgets/prompt.dart';
import 'package:spira/widgets/score.dart';

class GameView extends StatefulWidget {
  final int breathLevel;
  final Lesson lesson;

  const GameView({Key? key, required this.breathLevel, required this.lesson})
      : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late Timer _timer;

  LessonState state = LessonState.ready;

  int sequence = 0;
  List<Score> scoreList = [];

  @override
  void initState() {
    super.initState();
    resetScore();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void resetScore() {
    setState(() {
      scoreList = widget.lesson.sequence.map((e) => Score.empty).toList();
    });
  }

  void updateGameSequence() {
    if ((sequence < widget.lesson.sequence.length - 1) ||
        (state != LessonState.complete)) {
      setState(() {
        sequence++;
        state = widget.lesson.sequence[sequence];
      });

      _timer = Timer(Duration(seconds: widget.lesson.maxInterval), () {
        updateGameSequence();
        setScore(false);
      });
    }
  }

  void setScore(bool didComplete) {
    setState(() {
      scoreList[sequence] = didComplete ? Score.success : Score.failure;
    });
  }

  void restartPressed() {
    setState(() {
      sequence = 0;
      state = widget.lesson.sequence[0];
    });
    resetScore();
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
        return "Get Ready";
      case LessonState.inhale:
        return "Breath In";
      case LessonState.exhale:
        return "Breath Out Slowly";
      case LessonState.complete:
        return "All Done!";
      default:
        return "";
    }
  }

  Widget controls() {
    switch (state) {
      case LessonState.ready:
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: updateGameSequence,
                  style: ButtonStyles.buttonGreen,
                  child: const Text("Start")),
            ),
          ],
        );
      case LessonState.inhale:
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: restartPressed,
                  style: ButtonStyles.buttonRed,
                  child: const Text("Stop Training")),
            )
          ],
        );
      case LessonState.exhale:
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: restartPressed,
                  style: ButtonStyles.buttonRed,
                  child: const Text("Stop Training")),
            )
          ],
        );
      case LessonState.complete:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: exit,
                      style: ButtonStyles.buttonGreen,
                      child: const Text("Done")),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: restartPressed,
                      style: ButtonStyles.buttonDefault,
                      child: const Text("Restart")),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                onPressed: openSurvey,
                style: ButtonStyles.buttonDefault,
                child: const Text("Rate My Lesson"),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    if ((state == LessonState.inhale) &&
        widget.breathLevel < (Device.breathThreshold * -1)) {
      _timer.cancel();
      setScore(true);
      updateGameSequence();
    }

    if ((state == LessonState.exhale) &&
        widget.breathLevel > Device.breathThreshold) {
      _timer.cancel();
      setScore(true);
      updateGameSequence();
    }

    if (state == LessonState.complete) {
      _timer.cancel();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ScoreView(scoreList: scoreList),
        Center(
          child: PromptView(state: state),
        ),
        Text(promptText(),
            style:
                TextStyles.subtitle.copyWith(color: AppColors.labelSecondary)),
        controls(),
      ],
    );
  }
}
