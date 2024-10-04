String durationToString(Duration duration) {
  final str = duration.toString();
  return str.substring(0, str.length - 7);
}

Duration stringToDuration(String s) {
  final parts = s.split(":");
  final hours = int.parse(parts[0]);
  final minutes = int.parse(parts[1]);
  final seconds = int.parse(parts[2]);
  return Duration(hours: hours, minutes: minutes, seconds: seconds);
}
