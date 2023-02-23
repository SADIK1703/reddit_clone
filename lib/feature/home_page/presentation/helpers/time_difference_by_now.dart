extension TimeDifferenceHelper on DateTime {
  String timeDifferenceByNow() {
    final DateTime now = DateTime.now().toUtc();
    final Duration timeDifference = difference(now);
    final DateTime timeDifferenceAsDateTime = DateTime.fromMicrosecondsSinceEpoch(timeDifference.inMicroseconds);
    if (timeDifferenceAsDateTime.year > 1) {
      return '${timeDifferenceAsDateTime.year}y';
    }
    if (timeDifferenceAsDateTime.month > 1) {
      return '${timeDifferenceAsDateTime.month}mo';
    }
    if (timeDifferenceAsDateTime.day > 1) {
      return '${timeDifferenceAsDateTime.day}d';
    }
    if (timeDifferenceAsDateTime.hour > 1) {
      return '${timeDifferenceAsDateTime.hour}h';
    }
    if (timeDifferenceAsDateTime.minute > 1) {
      return '${timeDifferenceAsDateTime.minute}m';
    } else {
      return '${timeDifferenceAsDateTime.second}sec';
    }
  }
}
