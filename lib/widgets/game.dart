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
  int score = 0;

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
      });
    }
  }

  void setScore() {
    setState(() {
      score++;
    });
  }

  void restartPressed() {
    setState(() {
      sequence = 0;
      score = 0;
      state = GameSequence.training[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case GameState.ready:
        return _View(
            text: "Ready", buttonText: "Start", onPressed: updateGameSequence);
      case GameState.inhale:
        if (widget.breathLevel < (Device.breathThreshold * -1)) {
          _timer.cancel;
          setScore();
          updateGameSequence();
        }
        return _View(
            text: "Inhale", buttonText: "Skip", onPressed: updateGameSequence);
      case GameState.exhale:
        if (widget.breathLevel > Device.breathThreshold) {
          _timer.cancel;
          setScore();
          updateGameSequence();
        }
        return _View(
            text: "Exhale", buttonText: "Skip", onPressed: updateGameSequence);
      case GameState.complete:
        return _View(
            text:
                "All Done! Score: $score of ${GameSequence.training.length - 2}",
            buttonText: "Restart",
            onPressed: restartPressed);
      default:
        return const Center(child: Text("Error"));
    }
  }
}

class _View extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function() onPressed;

  const _View(
      {super.key,
      required this.text,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(text)),
        MaterialButton(onPressed: onPressed, child: Text(buttonText)),
      ],
    );
  }
}
