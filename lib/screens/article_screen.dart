import 'package:flutter/material.dart';

import 'package:spira/constants/button_styles.dart';
import 'package:spira/constants/text_styles.dart';
import 'package:spira/constants/strings.dart';

import 'package:spira/widgets/base.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  void backPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Base(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: backPressed,
                  style: ButtonStyles.buttonDefault.copyWith(
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.fromLTRB(12, 0, 24, 0))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.chevron_left_rounded), Text("Home")],
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Text(
                Strings.helpTitle,
                style: TextStyles.title,
              )
            ],
          ),
        ),
        Text(Strings.helpBody, style: TextStyles.body),
      ],
    ));
  }
}
