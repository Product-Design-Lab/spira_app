import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:spira/constants.dart';
import 'package:spira/model/device.dart';
import 'package:spira/model/lesson.dart';
import 'package:spira/screens/help_screen.dart';

import 'package:spira/widgets/base.dart';
import 'package:spira/widgets/list_item.dart';

import 'package:spira/screens/lesson_screen.dart';

class HomeScreen extends StatefulWidget {
  final BluetoothDevice device;
  const HomeScreen({Key? key, required this.device}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void helpPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HelpScreen()));
  }

  void startLesson(Lesson lesson) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LessonScreen(
                  device: widget.device,
                  lesson: lesson,
                )));
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
              const Text("Lessons", style: TextStyles.title),
              IconButton(
                  onPressed: helpPressed,
                  icon: const Icon(
                    Icons.help_outline_rounded,
                    color: AppColors.labelPrimary,
                  ))
            ],
          ),
        ),
        Column(
          children: Device.lessons
              .map((lesson) => ListItem(
                  title: lesson.title,
                  description: lesson.description,
                  onPressed: () => startLesson(lesson)))
              .toList(),
        )
      ],
    ));
  }
}
