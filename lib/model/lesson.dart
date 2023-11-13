class Lesson {
  final String title;
  final String description;
  final List<LessonState> sequence;
  final int maxInterval;
  final int deviceMode;

  Lesson(this.title, this.description, this.sequence, this.maxInterval,
      this.deviceMode);
}

enum LessonState { ready, inhale, exhale, complete }

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
