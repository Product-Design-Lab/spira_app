import 'package:flutter/material.dart';

import 'package:spira/constants.dart';

import 'package:spira/widgets/base.dart';
import 'package:spira/widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void helpPressed() {
    Navigator.pushNamed(context, "/help");
  }

  void connect() {
    Navigator.pushNamed(context, "/connect");
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
              const Text("Sessions", style: TextStyles.title),
              IconButton(
                  onPressed: helpPressed,
                  icon: const Icon(
                    Icons.help_outline_rounded,
                    color: AppColors.labelPrimary,
                  ))
            ],
          ),
        ),
        ListItem(
          label: "Example Lesson",
          onPressed: connect,
        ),
      ],
    ));
  }
}
