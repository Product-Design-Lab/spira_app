import 'package:flutter/material.dart';
import 'package:app_template/constants.dart';

class StatusScreen extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const StatusScreen({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Center(child: Text(text)),
              MaterialButton(
                onPressed: onPressed,
                child: const Text("Example Action"),
              )
            ])));
  }
}
