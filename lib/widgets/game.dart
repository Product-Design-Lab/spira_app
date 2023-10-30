import 'dart:async';

import 'package:app_template/model.dart';
import 'package:flutter/material.dart';

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
  List<bool> scores = [];

  @override
  void initState() {
    super.initState();
  }

  void updateGameSequence() {
    if ((sequence < GameSequence.training.length - 1) ||
        (state != GameState.complete)) {
      setState(() {
        sequence++;
        state = GameSequence.training[sequence];
      });

      _timer = Timer(const Duration(seconds: 10), () {
        updateGameSequence();
        setScore(false);
      });
    }
  }

  void setScore(bool didComplete) {
    setState(() {
      scores = [...scores, didComplete];
    });
  }

  void restartPressed() {
    setState(() {
      sequence = 0;
      scores = [];
      state = GameSequence.training[0];
    });
  }

  int getTotalScore() {
    var total = 0;
    for (bool e in scores) {
      if (e == true) {
        total++;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case GameState.ready:
        return _View(
            score: 0,
            text: "Ready",
            buttonText: "Start",
            onPressed: updateGameSequence);
      case GameState.inhale:
        if (widget.breathLevel < (Device.breathThreshold * -1)) {
          _timer.cancel();
          setScore(true);
          updateGameSequence();
        }
        return _View(
            score: getTotalScore(),
            text: "Inhale",
            buttonText: "Skip",
            onPressed: updateGameSequence);
      case GameState.exhale:
        if (widget.breathLevel > Device.breathThreshold) {
          _timer.cancel();
          setScore(true);
          updateGameSequence();
        }
        return _View(
            score: getTotalScore(),
            text: "Exhale",
            buttonText: "Skip",
            onPressed: updateGameSequence);
      case GameState.complete:
        return _View(
            score: getTotalScore(),
            text: "All Done!",
            buttonText: "Restart",
            onPressed: restartPressed);
      default:
        return const Center(child: Text("Error"));
    }
  }
}

class _View extends StatelessWidget {
  final String text;
  final int score;
  final String buttonText;
  final Function() onPressed;

  const _View(
      {super.key,
      required this.text,
      required this.score,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child:
                Text("Score: $score of ${GameSequence.training.length - 2}")),
        Center(child: Text(text)),
        MaterialButton(onPressed: onPressed, child: Text(buttonText)),
      ],
    );
  }
}
