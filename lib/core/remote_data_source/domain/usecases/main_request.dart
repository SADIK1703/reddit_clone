import 'package:dartz/dartz.dart';
import 'package:reddit_clone/core/failures/failure.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/request_params.dart';
import 'package:reddit_clone/core/remote_data_source/domain/repo/base_request_repository.dart';
import 'package:reddit_clone/core/usecase/usecase.dart';

class MainRequest implements Usecase<String, RequestParams> {
  BaseRequestRepository repository;

  MainRequest(this.repository);

  @override
  Future<Either<Failure, String>> call(final params) async {
    return repository.request(requestParam: params);
  }
}
