extension DurationExtension on Duration {
  String get toStringAsTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(inHours)}:${twoDigits(inMinutes.remainder(60))}';
  }

  Duration substractTime(Duration duration) {
    var hourDiff = inHours - duration.inHours;
    var minuteDiff = inMinutes.remainder(60) - duration.inMinutes.remainder(60);
    return Duration(hours: hourDiff, minutes: minuteDiff);
  }
}
