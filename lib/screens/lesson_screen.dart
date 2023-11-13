import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:spira/constants/button_styles.dart';

import 'package:spira/model/device.dart';
import 'package:spira/model/lesson.dart';

import 'package:spira/widgets/base.dart';
import 'package:spira/widgets/game.dart';

class LessonScreen extends StatefulWidget {
  final BluetoothDevice device;
  final Lesson lesson;

  const LessonScreen({Key? key, required this.device, required this.lesson})
      : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  BluetoothConnectionState _connectionState =
      BluetoothConnectionState.disconnected;

  StreamSubscription<BluetoothConnectionState>? _connectionStateSubscription;

  StreamSubscription? _batteryLevelSubscription;
  StreamSubscription? _breathSubscription;
  StreamSubscription? _tongueForceSubscription;

  int batteryLevel = 0;
  int breath = 0;
  int tongueForce = 0;

  bool showDebugView = false;

  @override
  void initState() {
    super.initState();

    _connectionStateSubscription =
        widget.device.connectionState.listen((state) async {
      if (state == BluetoothConnectionState.connected) {
        update();
      }

      if (state == BluetoothConnectionState.disconnected) {
        await widget.device.connect();
      }

      setState(() {
        _connectionState = state;
      });
    });
  }

  @override
  void dispose() {
    _connectionStateSubscription?.cancel();
    _breathSubscription?.cancel();
    _batteryLevelSubscription?.cancel();
    _tongueForceSubscription?.cancel();
    super.dispose();
  }

  void update() async {
    List<BluetoothService> services = await widget.device.discoverServices();

    services.forEach((service) async {
      if (service.uuid.toString() == Device.service.toLowerCase()) {
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          List<int> value = await c.read();

          // breathCharacteristic
          if (c.uuid.toString() == Device.breathCharacteristic.toLowerCase()) {
            _breathSubscription = c.onValueReceived.listen((value) async {
              setState(() {
                breath = value[0].toSigned(8);
              });
            });

            await c.setNotifyValue(true);
          }

          // batteryLevelCharacteristic
          if (c.uuid.toString() ==
              Device.batteryLevelCharacteristic.toLowerCase()) {
            _batteryLevelSubscription = c.onValueReceived.listen((value) async {
              setState(() {
                batteryLevel = value[0];
              });
            });

            await c.setNotifyValue(true);
          }

          // tongueCharacteristic
          if (c.uuid.toString() == Device.tongueCharacteristic.toLowerCase()) {
            _tongueForceSubscription = c.onValueReceived.listen((value) async {
              setState(() {
                tongueForce = value[0];
              });
            });

            await c.setNotifyValue(true);
          }
        }
      }
    });
  }

  void reset() async {
    List<BluetoothService> services = await widget.device.discoverServices();

    services.forEach((service) async {
      if (service.uuid.toString() == Device.service.toLowerCase()) {
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          // resetCharacteristic
          if (c.uuid.toString() == Device.resetCharacteristic.toLowerCase()) {
            if (kReleaseMode) {
              c.write([widget.lesson.deviceMode]);
            } else {
              c.write([1]);
            }
          }
        }
      }
    });
  }

  void changeMode() async {
    List<BluetoothService> services = await widget.device.discoverServices();

    services.forEach((service) async {
      if (service.uuid.toString() == Device.service.toLowerCase()) {
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          // modeCharacteristic
          if (c.uuid.toString() == Device.modeCharacteristic.toLowerCase()) {
            c.write([1]);
          }
        }
      }
    });
  }

  void exit() {
    widget.device.disconnect();
  }

  void toggleDebug() {
    setState(() {
      showDebugView = showDebugView ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Base(
        showBackButton: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: GameView(
              breathLevel: breath,
              tongueForce: tongueForce,
              lesson: widget.lesson,
              onStart: changeMode,
            )),
            if (showDebugView)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 64, 0, 64),
                child: Column(children: [
                  Center(child: Text("Breath Level Characterstic: $breath")),
                  Center(
                      child: Text("Tongue Force Characterstic: $tongueForce")),
                  Center(
                      child:
                          Text("Battery Level Characterstic: $batteryLevel")),
                  MaterialButton(onPressed: reset, child: const Text("Reset")),
                  MaterialButton(
                      onPressed: changeMode, child: const Text("Change Mode")),
                ]),
              ),
            if (!kReleaseMode)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: toggleDebug,
                  style: ButtonStyles.buttonDefault,
                  child: const Text("Toggle Debug View"),
                ),
              ),
          ],
        ));
  }
}
