import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:spira/constants/text_styles.dart';
import 'package:spira/constants/colors.dart';

import 'package:spira/model/device.dart';
import 'package:spira/model/lesson.dart';

class PromptView extends StatelessWidget {
  final LessonState state;

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
      case LessonState.ready:
        return graphic("Ready?", AppColors.labelPrimary, AppColors.greyAccent,
            Colors.transparent, 0);
      case LessonState.inhale:
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
      case LessonState.exhale:
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
      case LessonState.complete:
        return graphic("All Done", AppColors.greenForeground,
            AppColors.greenAccent, Colors.transparent, 0);
      default:
        return const Center(child: Text("Error"));
    }
  }
}
