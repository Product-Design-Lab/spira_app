import 'package:spira/model/lesson.dart';

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

  static int breathMaxMagnitude = 100;

  static int breathThreshold = 80;
  static int breathDuration = 5;
  static int forceThreshold = 80;

  static const String surveyURL = "https://forms.office.com/r/jhXepe74BQ";
  static const String helpURL =
      "https://nbatham.notion.site/Aeolus-User-Guide-227b7704d23242899629c443a65621f0?pvs=4";

  static List<Lesson> lessons = [
    Lesson(
        title: "Device Training",
        description: "Learn to use the device",
        sequence: [
          LessonState.ready,
          LessonState.inhale,
          LessonState.exhale,
          LessonState.complete
        ],
        maxInterval: 5,
        deviceMode: 0,
        type: LessonType.breath),
    Lesson(
        title: "Tongue Pressure Training",
        description: "Build tongue muscles",
        sequence: [
          LessonState.ready,
          LessonState.impress,
          LessonState.depress,
          LessonState.complete
        ],
        maxInterval: 5,
        deviceMode: 0,
        type: LessonType.force),
    Lesson(
        title: "Circular Breathing (Short)",
        description: "Steady breath for 10 seconds",
        sequence: [
          LessonState.ready,
          LessonState.maintain,
          LessonState.complete
        ],
        maxInterval: 10,
        deviceMode: 0,
        type: LessonType.timed),
    Lesson(
        title: "Circular Breathing (Medium)",
        description: "Steady breath for 20 seconds",
        sequence: [
          LessonState.ready,
          LessonState.maintain,
          LessonState.complete
        ],
        maxInterval: 20,
        deviceMode: 0,
        type: LessonType.timed),
    Lesson(
        title: "Circular Breathing (Long)",
        description: "Steady breath for 30 seconds",
        sequence: [
          LessonState.ready,
          LessonState.maintain,
          LessonState.complete
        ],
        maxInterval: 30,
        deviceMode: 0,
        type: LessonType.timed),
  ];
}
