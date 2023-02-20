import 'package:reddit_clone/core/failures/base_response_status_failures.dart';
import 'package:reddit_clone/core/failures/failure.dart';

enum StatusCodeEnums {
  statusCode200(true), //* OK
  statusCode201(true), //* Created
  statusCode204(true), //* No Content
  statusCode400(false), //* Bad Request
  statusCode401(false), //* Unauthorized
  statusCode403(false), //* Forbidden
  statusCode404(false), //* Not Found
  statusCode500(false), //* Internal Exception
  statusCode504(false); //* Gateway TimeOut

  final bool isSuccess;
  const StatusCodeEnums(this.isSuccess);
}

extension StatusCodeEnumsExtension on StatusCodeEnums {
  static StatusCodeEnums statusCodeToEnum(final int statusCode) {
    return StatusCodeEnums.values.firstWhere(
      (final element) => element.name.contains(statusCode.toString()),
    );
  }

  Failure? stateToFailure() {
    switch (this) {
      case StatusCodeEnums.statusCode400:
        return BadRequestFailure();
      case StatusCodeEnums.statusCode401:
        return UnauthorizedFailure();
      case StatusCodeEnums.statusCode403:
        return ForbiddenFailure();
      case StatusCodeEnums.statusCode404:
        return NotFoundFailure();
      case StatusCodeEnums.statusCode500:
      case StatusCodeEnums.statusCode504:
        return GatewayTimeOutFailure();
      case StatusCodeEnums.statusCode200:
      case StatusCodeEnums.statusCode201:
      case StatusCodeEnums.statusCode204:
        return null;
    }
  }
}
