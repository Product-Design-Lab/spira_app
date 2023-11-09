import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:spira/constants.dart';

import 'package:spira/widgets/base.dart';
import 'package:spira/widgets/list_item.dart';

import 'package:spira/screens/device_screen.dart';

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
    Navigator.pushNamed(context, "/help");
  }

  void connect() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DeviceScreen(device: widget.device)));
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
