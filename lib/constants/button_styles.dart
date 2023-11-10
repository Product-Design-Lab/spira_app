import 'package:flutter/material.dart';

import 'package:spira/constants/colors.dart';
import 'package:spira/constants/text_styles.dart';

class ButtonStyles {
  static ButtonStyle buttonDefault = ButtonStyle(
      textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyles.body),
      foregroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.greyForeground),
      backgroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.greyBackground),
      fixedSize: const MaterialStatePropertyAll<Size?>(Size.fromHeight(48)),
      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
      padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(12.0)),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0))));

  static ButtonStyle buttonGreen = buttonDefault.copyWith(
      foregroundColor: const MaterialStatePropertyAll<Color>(
        AppColors.greenForeground,
      ),
      backgroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.greenBackground));

  static ButtonStyle buttonRed = buttonDefault.copyWith(
      foregroundColor: const MaterialStatePropertyAll<Color>(
        AppColors.redForeground,
      ),
      backgroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.redBackground));

  static ButtonStyle buttonYellow = buttonDefault.copyWith(
      foregroundColor: const MaterialStatePropertyAll<Color>(
        AppColors.yellowForeground,
      ),
      backgroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.yellowBackground));
}
