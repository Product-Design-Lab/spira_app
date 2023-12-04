import 'package:flutter/material.dart';

import 'package:spira/constants/text_styles.dart';
import 'package:spira/constants/colors.dart';

import 'package:spira/model/device.dart';
import 'package:spira/model/lesson.dart';

class MeasureView extends StatelessWidget {
  final LessonState state;
  final int level;

  const MeasureView({super.key, required this.state, required this.level});

  Widget graphic(String label, Color foregroundColor, Color backgroundColor,
      Color shadowColor, double spread) {
    const double size = 240;

    return SizedBox(
      width: 240,
      height: 240,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
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

  String measuredText() {
    if (level > Device.breathThreshold) {
      return "Less Flow";
    } else if (level < (Device.breathThreshold * -1)) {
      return "More Flow";
    } else {
      return state.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double maxSpread = 60;
    var measuredSpread = ((level + Device.breathMaxMagnitude) /
            (Device.breathMaxMagnitude * 2)) *
        maxSpread;

    var measuredForeground = (level.abs() <= Device.breathThreshold)
        ? AppColors.yellowForeground
        : AppColors.orangeForeground;

    var measuredAccent = (level.abs() <= Device.breathThreshold)
        ? AppColors.yellowAccent
        : AppColors.orangeAccent;

    var measuredBackground = (level.abs() <= Device.breathThreshold)
        ? AppColors.yellowBackground
        : AppColors.orangeBackground;

    switch (state) {
      case LessonState.ready:
        return graphic(state.title, AppColors.labelPrimary,
            AppColors.greyAccent, Colors.transparent, 0);
      case LessonState.maintain:
        return graphic(measuredText(), measuredForeground, measuredAccent,
            measuredBackground, measuredSpread);
      case LessonState.complete:
        return graphic("All Done", AppColors.greenForeground,
            AppColors.greenAccent, Colors.transparent, 0);
      default:
        return const Center(child: Text("Error"));
    }
  }
}
