import 'dart:async';

import 'package:app_template/model.dart';
import 'package:flutter/material.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late Timer _timer;

  GameState state = GameState.ready;

  int sequence = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (state != GameState.complete) {
        updateGameSequence();
      }
    });
  }

  void updateGameSequence() {
    if (sequence < GameSequence.training.length) {
      setState(() {
        sequence++;
        state = GameSequence.training[sequence];
      });
    }
  }

  void restartPressed() {
    setState(() {
      sequence = 0;
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
        return _View(
            text: "Inhale",
            buttonText: "Inhaled!",
            onPressed: updateGameSequence);
      case GameState.exhale:
        return _View(
            text: "Exhale",
            buttonText: "Exhaled!",
            onPressed: updateGameSequence);
      case GameState.complete:
        return _View(
            text: "All Done", buttonText: "Restart", onPressed: restartPressed);
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
