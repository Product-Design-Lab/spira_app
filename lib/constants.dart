import 'package:flutter/material.dart';

class AppColors {
  static const Color labelPrimary = Color.fromRGBO(51, 51, 51, 1);
  static const Color labelSecondary = Color.fromRGBO(60, 60, 67, 0.6);

  static const Color background = Colors.white;

  static const Color greyAccent = Color.fromRGBO(245, 245, 245, 1);
  static const Color greyForeground = Color.fromRGBO(51, 51, 51, 1);
  static const Color greyBackground = Color.fromRGBO(245, 245, 245, 1);

  static const Color yellowAccent = Color.fromRGBO(255, 204, 92, 1);
  static const Color yellowForeground = Color.fromRGBO(145, 94, 10, 1);
  static const Color yellowBackground = Color.fromRGBO(255, 204, 92, 0.25);

  static const Color greenAccent = Color.fromRGBO(161, 207, 116, 1);
  static const Color greenForeground = Color.fromRGBO(21, 67, 0, 1);
  static const Color greenBackground = Color.fromRGBO(208, 231, 185, 1);

  static const Color orangeAccent = Color.fromRGBO(255, 138, 40, 1);
  static const Color orangeForeground = Color.fromRGBO(125, 18, 0, 1);
  static const Color orangeBackground = Color.fromRGBO(255, 204, 92, 0.25);

  static const Color redAccent = Color.fromRGBO(255, 117, 78, 1);
  static const Color redForeground = Color.fromRGBO(125, 18, 0, 1);
  static const Color redBackground = Color.fromRGBO(255, 117, 78, 0.5);
}

class TextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.labelPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.4,
      height: 1.29);
}

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
}
