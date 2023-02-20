import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_clone/core/failures/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(final Params params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object> get props => [];
}
