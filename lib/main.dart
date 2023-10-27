import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:app_template/screens/home_screen.dart';
import 'package:app_template/screens/connect_screen.dart';
import 'package:app_template/screens/device_screen.dart';

void main() {
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan
    ].request().then((status) {
      runApp(const MainApp());
    });
  } else {
    runApp(const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spira",
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/connect": (context) => const ConnectScreen(),
        "/device": (context) => const DeviceScreen(),
      },
    );
  }
}
