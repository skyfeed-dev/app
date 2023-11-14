String renderTimestamp(DateTime ts) {
  final dur = DateTime.now().difference(ts);
  if (dur < Duration.zero) {
    return 'in ${dur.inHours.abs()}h';
  } else if (dur < const Duration(minutes: 1)) {
    return '${dur.inSeconds}s';
  } else if (dur < const Duration(hours: 1)) {
    return '${dur.inMinutes}m';
  } else if (dur < const Duration(hours: 24)) {
    return '${dur.inHours}h';
  } else if (dur < const Duration(days: 30)) {
    return '${dur.inDays}d';
  } else {
    return '${(dur.inDays / 30).round()}mon';
  }
}
