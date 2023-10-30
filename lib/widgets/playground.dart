import 'package:flutter/material.dart';

import 'package:spira/constants.dart';

import 'package:spira/widgets/base.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  void backPressed() {}

  @override
  Widget build(BuildContext context) {
    return Base(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child:
              Center(child: Text("Connecting...", style: TextStyles.subtitle)),
        ),
        Text("Ensure your device is on and nearby",
            style: TextStyles.body.copyWith(color: AppColors.labelSecondary))
      ],
    ));
  }
}
