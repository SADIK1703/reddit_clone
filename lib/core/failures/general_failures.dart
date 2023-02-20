import 'package:reddit_clone/core/failures/failure.dart';

class NullPointerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ListEmptyFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServiceMessageFailure extends Failure {
  static String message = "";
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmptyResultFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CustomMessageFailure extends Failure {
  const CustomMessageFailure(super.remoteErrorMessage);
  @override
  List<Object?> get props => throw UnimplementedError();
}
