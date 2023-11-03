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

  static int breathThreshold = 80;
  static int breathDuration = 5;
}

enum GameState { ready, inhale, exhale, complete }

enum Score {
  empty,
  failure,
  success;

  static int getTotal(List<Score> scoreList) {
    var total = 0;
    for (Score i in scoreList) {
      if (i == Score.success) {
        total++;
      }
    }
    return total;
  }
}

class GameSequence {
  static const List<GameState> training = [
    GameState.ready,
    GameState.inhale,
    GameState.exhale,
    GameState.inhale,
    GameState.exhale,
    GameState.complete
  ];

  static const int maxSeconds = 5;
}
