import 'package:flutter/material.dart';

import 'package:spira/constants/text_styles.dart';
import 'package:spira/constants/colors.dart';
import 'package:spira/model/device.dart';

class MeasureView extends StatelessWidget {
  final int level;

  const MeasureView({super.key, required this.level});

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

  @override
  Widget build(BuildContext context) {
    const double maxSpread = 60;
    var measuredSpread = ((level + Device.breathMaxMagnitude) /
            (Device.breathMaxMagnitude * 2)) *
        maxSpread;

    var measuredForeground = (level.abs() <= Device.breathThreshold)
        ? AppColors.greenForeground
        : AppColors.orangeForeground;

    var measuredAccent = (level.abs() <= Device.breathThreshold)
        ? AppColors.greenAccent
        : AppColors.orangeAccent;

    var measuredBackground = (level.abs() <= Device.breathThreshold)
        ? AppColors.greenBackground
        : AppColors.orangeBackground;

    return graphic("label", measuredForeground, measuredAccent,
        measuredBackground, measuredSpread);
  }
}
