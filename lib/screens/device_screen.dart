import 'package:flutter/material.dart';

import 'package:app_template/widgets/base.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  void initState() {
    super.initState();
  }

  void home() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Base(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const Center(child: Text("Device Screen")),
          MaterialButton(onPressed: home, child: const Text("Back")),
        ]));
  }
}
