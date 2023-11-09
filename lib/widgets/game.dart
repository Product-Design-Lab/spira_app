import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:spira/model.dart';
import 'package:spira/constants.dart';

import 'package:spira/widgets/prompt.dart';
import 'package:spira/widgets/score.dart';

class GameView extends StatefulWidget {
  final int breathLevel;

  const GameView({Key? key, required this.breathLevel}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late Timer _timer;

  GameState state = GameState.ready;

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
      scoreList = GameSequence.training.map((e) => Score.empty).toList();
    });
  }

  void updateGameSequence() {
    if ((sequence < GameSequence.training.length - 1) ||
        (state != GameState.complete)) {
      setState(() {
        sequence++;
        state = GameSequence.training[sequence];
      });

      _timer = Timer(const Duration(seconds: GameSequence.maxSeconds), () {
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
      state = GameSequence.training[0];
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
      case GameState.ready:
        return "Get Ready";
      case GameState.inhale:
        return "Breath In";
      case GameState.exhale:
        return "Breath Out Slowly";
      case GameState.complete:
        return "All Done!";
      default:
        return "";
    }
  }

  Widget controls() {
    switch (state) {
      case GameState.ready:
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
      case GameState.inhale:
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
      case GameState.exhale:
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
      case GameState.complete:
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
    if ((state == GameState.inhale) &&
        widget.breathLevel < (Device.breathThreshold * -1)) {
      _timer.cancel();
      setScore(true);
      updateGameSequence();
    }

    if ((state == GameState.exhale) &&
        widget.breathLevel > Device.breathThreshold) {
      _timer.cancel();
      setScore(true);
      updateGameSequence();
    }

    if (state == GameState.complete) {
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
