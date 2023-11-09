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

  static int breathThreshold = 80;
  static int breathDuration = 5;

  static const String surveyURL = "https://forms.office.com/r/jhXepe74BQ";

  static List<Lesson> lessons = [
    Lesson(
        "Device Training",
        "Learn to use the device with a quick breather",
        [
          LessonState.ready,
          LessonState.inhale,
          LessonState.exhale,
          LessonState.complete
        ],
        5),
    Lesson(
        "Circular Breathing",
        "5 cycles of inhales and exhales",
        [
          LessonState.ready,
          LessonState.inhale,
          LessonState.exhale,
          LessonState.inhale,
          LessonState.exhale,
          LessonState.inhale,
          LessonState.exhale,
          LessonState.inhale,
          LessonState.exhale,
          LessonState.inhale,
          LessonState.exhale,
          LessonState.complete
        ],
        5),
  ];
}
