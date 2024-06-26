import 'package:dio/dio.dart';
import 'package:reddit_clone/core/failures/failure.dart';
import 'package:reddit_clone/core/failures/general_failures.dart';

class BadRequestFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnauthorizedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ForbiddenFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class GatewayTimeOutFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class RequestCancelledFailure extends Failure {
  const RequestCancelledFailure(this.reason);
  final String reason;
  @override
  List<Object?> get props => [];
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

Failure getFailureByDioErrors(final DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return GatewayTimeOutFailure();
    case DioExceptionType.sendTimeout:
      return GatewayTimeOutFailure();
    case DioExceptionType.receiveTimeout:
      return GatewayTimeOutFailure();
    case DioExceptionType.cancel:
      return RequestCancelledFailure(error.message ?? '');
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
    case DioExceptionType.badResponse:
    case DioExceptionType.unknown:
      throw CustomMessageFailure(error.message ?? '');
  }
}
