import 'package:flutter/material.dart';

import 'package:spira/model.dart';
import 'package:spira/constants.dart';

class PromptView extends StatelessWidget {
  final GameState state;

  const PromptView({super.key, required this.state});

  Widget graphic(String label, Color foregroundColor, Color backgroundColor,
      Color shadowColor) {
    const double size = 240;
    const double spread = 60;

    return SizedBox(
      width: 240,
      height: 240,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: shadowColor,
                  offset: Offset.zero,
                  spreadRadius: spread,
                  blurStyle: BlurStyle.normal)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(size))),
        child: Center(
            child: Text(
          label,
          style: TextStyles.subtitle.copyWith(color: foregroundColor),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case GameState.ready:
        return graphic("Ready?", AppColors.labelPrimary, AppColors.greyAccent,
            Colors.transparent);
      case GameState.inhale:
        return graphic("Inhale", AppColors.orangeForeground,
            AppColors.orangeAccent, AppColors.orangeBackground);
      case GameState.exhale:
        return graphic("Exhale", AppColors.yellowForeground,
            AppColors.yellowAccent, AppColors.yellowBackground);
      case GameState.complete:
        return graphic("All Done", AppColors.greenForeground,
            AppColors.greenAccent, Colors.transparent);
      default:
        return const Center(child: Text("Error"));
    }
  }
}
