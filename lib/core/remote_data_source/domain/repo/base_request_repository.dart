import 'package:dartz/dartz.dart';
import 'package:reddit_clone/core/failures/failure.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/request_params.dart';

abstract class BaseRequestRepository {
  Future<Either<Failure, String>> request({
    required final RequestParams requestParam,
  });
}
