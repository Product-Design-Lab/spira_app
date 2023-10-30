import 'package:flutter/material.dart';

import 'package:spira/model.dart';
import 'package:spira/constants.dart';

class PromptView extends StatelessWidget {
  final GameState state;

  const PromptView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case GameState.ready:
        return SizedBox(
          width: 240,
          height: 240,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.greyAccent,
                borderRadius: BorderRadius.all(Radius.circular(120))),
            child: Center(
                child: Text(
              "Ready?",
              style:
                  TextStyles.subtitle.copyWith(color: AppColors.greyForeground),
            )),
          ),
        );
      case GameState.inhale:
        return SizedBox(
          width: 240,
          height: 240,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(120))),
            child: Center(
                child: Text(
              "Inhale",
              style: TextStyles.subtitle
                  .copyWith(color: AppColors.orangeForeground),
            )),
          ),
        );
      case GameState.exhale:
        return SizedBox(
          width: 240,
          height: 240,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.yellowAccent,
                borderRadius: BorderRadius.all(Radius.circular(120))),
            child: Center(
                child: Text(
              "Exhale",
              style: TextStyles.subtitle
                  .copyWith(color: AppColors.yellowForeground),
            )),
          ),
        );
      case GameState.complete:
        return SizedBox(
          width: 240,
          height: 240,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(120))),
            child: Center(
                child: Text(
              "All Done",
              style: TextStyles.subtitle
                  .copyWith(color: AppColors.greenForeground),
            )),
          ),
        );
      default:
        return const Center(child: Text("Error"));
    }
  }
}
