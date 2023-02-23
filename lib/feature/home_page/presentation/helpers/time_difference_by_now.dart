extension TimeDifferenceHelper on DateTime {
  String timeDifferenceByNow() {
    final DateTime now = DateTime.now().toUtc();
    final DateTime epoch = DateTime.fromMillisecondsSinceEpoch(0);
    final Duration timeDifference = now.difference(this);
    final DateTime timeDifferenceAsDateTime = DateTime.fromMicrosecondsSinceEpoch(timeDifference.inMicroseconds);
    if (timeDifferenceAsDateTime.year - epoch.year > 1) {
      return '${timeDifferenceAsDateTime.year}y';
    }
    if (timeDifferenceAsDateTime.month - epoch.month > 1) {
      return '${timeDifferenceAsDateTime.month}mo';
    }
    if (timeDifferenceAsDateTime.day - epoch.day > 1) {
      return '${timeDifferenceAsDateTime.day}d';
    }
    if (timeDifferenceAsDateTime.hour - epoch.hour > 1) {
      return '${timeDifferenceAsDateTime.hour}h';
    }
    if (timeDifferenceAsDateTime.minute - epoch.minute > 1) {
      return '${timeDifferenceAsDateTime.minute}m';
    } else {
      return '${timeDifferenceAsDateTime.second}sec';
    }
  }
}
