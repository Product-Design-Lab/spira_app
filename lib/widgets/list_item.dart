import 'package:flutter/material.dart';
import 'package:spira/constants.dart';

class ListItem extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const ListItem({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyles.buttonDefault.copyWith(
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.greyForeground,
            )
          ],
        ),
      ),
    );
  }
}
