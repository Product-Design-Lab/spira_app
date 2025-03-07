import 'package:flutter/material.dart';

import 'package:spira/constants/button_styles.dart';
import 'package:spira/constants/text_styles.dart';
import 'package:spira/constants/colors.dart';

import 'package:spira/model/lesson.dart';

import 'package:spira/widgets/base.dart';
import 'package:spira/widgets/prompt.dart';
import 'package:spira/widgets/score.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  bool toggled = false;

  void backPressed() {}

  void toggle() {
    setState(() {
      toggled = !toggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Base(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ScoreView(scoreList: [
          Score.failure,
          Score.success,
          Score.empty,
          Score.empty,
          Score.empty
        ]),
        Center(
            child: PromptView(
                state: toggled ? LessonState.inhale : LessonState.exhale)),
        Text(
          "Prompt Text",
          style: TextStyles.subtitle.copyWith(color: AppColors.labelSecondary),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: toggle,
                    style: ButtonStyles.buttonGreen,
                    child: const Text("Start")),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: backPressed,
                    style: ButtonStyles.buttonDefault,
                    child: const Text("Restart")),
              )
            ],
          ),
        )
      ],
    ));
  }
}
