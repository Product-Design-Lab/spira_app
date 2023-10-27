import 'package:app_template/widgets/game.dart';
import 'package:flutter/material.dart';

import 'package:app_template/widgets/base.dart';

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

  void connect() {
    Navigator.pushNamed(context, "/connect");
  }

  @override
  Widget build(BuildContext context) {
    return Base(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const Center(child: Text("Home Screen")),
          MaterialButton(onPressed: connect, child: const Text("Connect")),
        ]));
  }
}
