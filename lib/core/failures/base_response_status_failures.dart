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

Failure getFailureByDioErrors(final DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return GatewayTimeOutFailure();
    case DioErrorType.sendTimeout:
      return GatewayTimeOutFailure();
    case DioErrorType.receiveTimeout:
      return GatewayTimeOutFailure();
    case DioErrorType.cancel:
      return RequestCancelledFailure(error.message ?? '');
    case DioErrorType.connectionError:
    case DioErrorType.badCertificate:
    case DioErrorType.badResponse:
    case DioErrorType.unknown:
      throw CustomMessageFailure(error.message ?? '');
  }
}
