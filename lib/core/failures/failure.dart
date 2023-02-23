import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([
    this.errorMessage,
    final List properties = const <dynamic>[],
  ]);

  final String? errorMessage;
}
