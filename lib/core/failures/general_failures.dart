import 'package:reddit_clone/core/failures/failure.dart';

class NullPointerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ListEmptyFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyResultFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CustomMessageFailure extends Failure {
  const CustomMessageFailure(super.errorMessage);
  @override
  List<Object?> get props => [super.errorMessage];
}
