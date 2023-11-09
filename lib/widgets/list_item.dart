import 'package:flutter/material.dart';
import 'package:spira/constants.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String description;
  final Function() onPressed;

  const ListItem(
      {super.key,
      required this.title,
      required this.description,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyles.buttonYellow.copyWith(
            fixedSize:
                const MaterialStatePropertyAll<Size?>(Size.fromHeight(72)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.body.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                Text(
                  description,
                  style: TextStyles.footnote
                      .copyWith(color: AppColors.yellowForeground),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.yellowForeground,
            )
          ],
        ),
      ),
    );
  }
}
