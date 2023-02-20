import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([
    this.remoteErrorMessage,
    final List properties = const <dynamic>[],
  ]);

  final String? remoteErrorMessage;
}
