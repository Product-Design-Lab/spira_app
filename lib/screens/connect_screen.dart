import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:app_template/model.dart';
import 'package:app_template/constants.dart';

import 'package:app_template/screens/device_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: AppColors.background,
        home: StreamBuilder<BluetoothAdapterState>(
          stream: FlutterBluePlus.adapterState,
          initialData: BluetoothAdapterState.unknown,
          builder: (context, snapshot) {
            if (snapshot.data == BluetoothAdapterState.on) {
              return const _ScannerScreen();
            }
            return const _StatusScreen(text: "Bluetooth is Off");
          },
        ));
  }
}

class _ScannerScreen extends StatelessWidget {
  const _ScannerScreen({Key? key}) : super(key: key);

  void connect(BuildContext context) async {
    await FlutterBluePlus.startScan();
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.device.platformName == Device.name) {
          FlutterBluePlus.stopScan();
          result.device.connect();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeviceScreen(device: result.device)));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    connect(context);
    return const _StatusScreen(text: "Connecting...");
  }
}

class _StatusScreen extends StatelessWidget {
  final String text;

  const _StatusScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Base(child: Text(text));
  }
}
