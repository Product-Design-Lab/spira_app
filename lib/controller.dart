import 'dart:async';

import 'package:app_template/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:app_template/view.dart';
import 'package:app_template/model.dart';

class BluetoothController extends StatelessWidget {
  const BluetoothController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.background,
      home: StreamBuilder<BluetoothAdapterState>(
          stream: FlutterBluePlus.adapterState,
          initialData: BluetoothAdapterState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothAdapterState.on) {
              return const DeviceScanner();
            }
            return StatusScreen(
              text: "No Device Connected",
              onPressed: () => {},
            );
          }),
    );
  }
}

// Device Scanner Screen
// ------------------------------------------------------------
class DeviceScanner extends StatelessWidget {
  const DeviceScanner({Key? key}) : super(key: key);

  void scanAndConnect(BuildContext context) async {
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
    scanAndConnect(context);
    return StatusScreen(
      text: "Connecting...",
      onPressed: () => {},
    );
  }
}

// Device Screen
// ------------------------------------------------------------
class DeviceScreen extends StatefulWidget {
  final BluetoothDevice device;

  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  late Timer _timer;

  int exampleCharacteristic = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      update();
    });
  }

  void update() async {
    List<BluetoothService> services = await widget.device.discoverServices();

    services.forEach((service) async {
      var characteristics = service.characteristics;
      for (BluetoothCharacteristic c in characteristics) {
        List<int> value = await c.read();

        // exampleCharacteristic
        if (c.uuid.toString() == Device.exampleCharacteristic.toLowerCase()) {
          setState(() {
            exampleCharacteristic = value[0];
          });
        }
      }
    });
  }

  void exampleAction() async {
    List<BluetoothService> services = await widget.device.discoverServices();

    services.forEach((service) async {
      var characteristics = service.characteristics;
      for (BluetoothCharacteristic c in characteristics) {
        // Example Action Characteristic
        if (c.uuid.toString() ==
            Device.exampleActionCharacteristic.toLowerCase()) {
          c.write([0]);
        }
      }
    });
  }

  void exit() {
    widget.device.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return StatusScreen(
      text: "exampleCharacteristic: $exampleCharacteristic",
      onPressed: exampleAction,
    );
  }
}
