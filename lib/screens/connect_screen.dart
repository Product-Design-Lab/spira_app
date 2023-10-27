import 'package:flutter/material.dart';

import 'package:app_template/widgets/base.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  void initState() {
    super.initState();
  }

  void home() {
    Navigator.pop(context);
  }

  void connected() {
    Navigator.pushNamed(context, "/device");
  }

  @override
  Widget build(BuildContext context) {
    return Base(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const Center(child: Text("Connect Screen")),
          MaterialButton(onPressed: home, child: const Text("Back")),
          MaterialButton(onPressed: connected, child: const Text("Device")),
        ]));
  }
}
