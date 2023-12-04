class Lesson {
  final String title;
  final String description;
  final List<LessonState> sequence;
  final int maxInterval;
  final int deviceMode;
  final LessonType type;

  Lesson(
      {required this.title,
      required this.description,
      required this.sequence,
      required this.maxInterval,
      required this.deviceMode,
      required this.type});
}

enum LessonType { breath, force, timed }

enum LessonState {
  ready,
  inhale,
  exhale,
  impress,
  depress,
  maintain,
  complete;

  String get title {
    switch (this) {
      case LessonState.ready:
        return "Ready?";
      case LessonState.inhale:
        return "Inhale";
      case LessonState.exhale:
        return "Exhale";
      case LessonState.impress:
        return "Push";
      case LessonState.depress:
        return "Pull";
      case LessonState.maintain:
        return "Circulate";
      default:
        return "";
    }
  }

  String get prompt {
    switch (this) {
      case LessonState.ready:
        return "Ready to begin lesson?";
      case LessonState.inhale:
        return "Breath in with puffed cheeks";
      case LessonState.exhale:
        return "Breath out slowly with puffed cheeks";
      case LessonState.impress:
        return "Apply pressure with the tongue";
      case LessonState.depress:
        return "Release your tongue";
      case LessonState.maintain:
        return "Maintain a steady breath flow";
      default:
        return "";
    }
  }
}

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
