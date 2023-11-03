import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:spira/model.dart';
import 'package:spira/constants.dart';

class PromptView extends StatelessWidget {
  final GameState state;

  const PromptView({super.key, required this.state});

  Widget graphic(String label, Color foregroundColor, Color backgroundColor,
      Color shadowColor, double spread) {
    const double size = 240;

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
    const double spread = 60;

    switch (state) {
      case GameState.ready:
        return graphic("Ready?", AppColors.labelPrimary, AppColors.greyAccent,
            Colors.transparent, 0);
      case GameState.inhale:
        return LoopAnimationBuilder<double>(
          duration: Duration(seconds: Device.breathDuration),
          tween: Tween(begin: spread, end: 0),
          curve: Curves.easeIn,
          builder: (context, value, child) => graphic(
              "Inhale",
              AppColors.orangeForeground,
              AppColors.orangeAccent,
              AppColors.orangeBackground,
              value),
        );
      case GameState.exhale:
        return LoopAnimationBuilder<double>(
          duration: Duration(seconds: Device.breathDuration),
          tween: Tween(begin: 0, end: spread),
          curve: Curves.easeOut,
          builder: (context, value, child) => graphic(
              "Exhale",
              AppColors.yellowForeground,
              AppColors.yellowAccent,
              AppColors.yellowBackground,
              value),
        );
      case GameState.complete:
        return graphic("All Done", AppColors.greenForeground,
            AppColors.greenAccent, Colors.transparent, 0);
      default:
        return const Center(child: Text("Error"));
    }
  }
}
