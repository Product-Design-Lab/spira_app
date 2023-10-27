class Device {
  static const String name = "Aeolus_01";

  static const String service = "20B10020-E8F2-537E-4F6C-D104768A1214";

  static const String breathCharacteristic =
      "20B10022-E8F2-537E-4F6C-D104768A1214";
  static const String batteryLevelCharacteristic =
      "20B10023-E8F2-537E-4F6C-D104768A1214";
  static const String tongueCharacteristic =
      "20B10021-E8F2-537E-4F6C-D104768A1214";
  static const String resetCharacteristic =
      "20B10028-E8F2-537E-4F6C-D104768A1214";
  static const String modeCharacteristic =
      "20B10024-E8F2-537E-4F6C-D104768A1214";
}

enum GameState { ready, inhale, exhale, complete }

class GameSequence {
  static List<GameState> training = [
    GameState.ready,
    GameState.inhale,
    GameState.exhale,
    GameState.inhale,
    GameState.exhale,
    GameState.complete
  ];
}
