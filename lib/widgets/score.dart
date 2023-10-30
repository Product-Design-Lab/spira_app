import 'package:flutter/material.dart';

import 'package:spira/constants.dart';
import 'package:spira/model.dart';

class ScoreView extends StatelessWidget {
  final List<Score> scoreList;

  const ScoreView({super.key, required this.scoreList});

  Widget bar(Score score) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: SizedBox(
        width: 32,
        height: 8,
        child: Container(
          decoration: BoxDecoration(
              color: () {
                switch (score) {
                  case Score.empty:
                    return AppColors.greyAccent;
                  case Score.success:
                    return AppColors.greenAccent;
                  case Score.failure:
                    return AppColors.redAccent;
                  default:
                    return AppColors.greyAccent;
                }
              }(),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
        ),
      ),
    );
  }

  Widget progress() {
    return Row(
        children: scoreList
            .sublist(1, scoreList.length - 1)
            .map((score) => bar(score))
            .toList());
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
          "${Score.getTotal(scoreList)} of ${scoreList.length - 2}",
          style: TextStyles.body.copyWith(color: AppColors.labelSecondary),
        ),
      ],
    );
  }
}
