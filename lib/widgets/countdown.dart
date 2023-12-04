import 'package:flutter/material.dart';

import 'package:spira/constants/text_styles.dart';
import 'package:spira/constants/colors.dart';

class CountdownView extends StatelessWidget {
  final int max;
  final int current;

  const CountdownView({super.key, required this.max, required this.current});

  Widget progress() {
    const maxWidth = 128.0;
    var progressWidth = (current / max) * maxWidth;

    return SizedBox(
      width: maxWidth,
      height: 8,
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.greyAccent,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              width: progressWidth,
              duration: const Duration(milliseconds: 1100),
              decoration: const BoxDecoration(
                  color: AppColors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: progress(),
        ),
        Text(
          "${current}s",
          style: TextStyles.body.copyWith(color: AppColors.labelSecondary),
        ),
      ],
    );
  }
}
