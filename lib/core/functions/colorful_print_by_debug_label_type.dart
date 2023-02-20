import 'dart:developer';

void colorfulPrintByDebugLabelType(
  final Object? object,
  final DebugLabelType debugLabelType, {
  final String? debugLabelText,
}) {
  final String colorTag = debugLabelType.colorCode;
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern
      .allMatches('$object')
      .forEach((final match) => log('$colorTag${match.group(0)}$colorTag', name: debugLabelText ?? ''));
}

enum DebugLabelType {
  common,
  error,
  info,
  warning,
  success,
}

extension DebugLabelTypeHelper on DebugLabelType {
  String get colorCode {
    switch (this) {
      case DebugLabelType.common:
        return "\x1B[37m"; //white
      case DebugLabelType.error:
        return "\x1B[31m"; //red
      case DebugLabelType.info:
        return "\x1B[36m"; //blue
      case DebugLabelType.warning:
        return "\x1B[33m"; //yellow
      case DebugLabelType.success:
        return "\x1B[32m"; //green
    }
  }
}
