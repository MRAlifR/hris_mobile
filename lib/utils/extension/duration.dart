extension DurationExtension on Duration {
  String get timeToString {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(inHours)}:${twoDigits(inMinutes.remainder(60))}';
  }

  Duration timeSubstract(Duration duration) {
    var hourDiff = inHours - duration.inHours;
    var minuteDiff = inMinutes.remainder(60) - duration.inMinutes.remainder(60);
    return Duration(hours: hourDiff, minutes: minuteDiff);
  }
}
