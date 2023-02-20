import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reddit_clone/core/failures/failure.dart';
import 'package:reddit_clone/core/failures/general_failures.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/custom_interceptor.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/log_interceptor.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints_type.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/request_params.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/status_code_enums.dart';
import 'package:reddit_clone/core/remote_data_source/domain/repo/base_request_repository.dart';

class PingpongMainRequestImpl implements BaseRequestRepository {
  PingpongMainRequestImpl();

  @override
  Future<Either<Failure, String>> request({
    required final RequestParams requestParam,
  }) async {
    try {
      final String endPoint = requestParam.endPoint.path;
      final dynamic queryParameters = _getQueryParameterByRequest(requestParam);
      final dynamic data = _getDataByRequest(requestParam);
      final Dio instance = Dio()
        ..interceptors.addAll(
          [
            CustomInterceptor(requestParam),
            CustomLogInterceptor(),
          ],
        );
      final Response response = await instance.request(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );

      if (response.statusCode != null && !StatusCodeEnumsExtension.statusCodeToEnum(response.statusCode!).isSuccess) {
        return Left(StatusCodeEnumsExtension.statusCodeToEnum(response.statusCode!).stateToFailure()!);
      } else {
        return Right(response.data);
      }
    } catch (e) {
      return Left(CustomMessageFailure(e.toString()));
    }
  }

  dynamic _getQueryParameterByRequest(final RequestParams requestParam) {
    switch (requestParam.endPoint.stateToMethodType()) {
      case MainEndpointsType.post:
        return null;
      case MainEndpointsType.get:
        return requestParam.requestBody;
    }
  }

  dynamic _getDataByRequest(final RequestParams requestParam) async {
    switch (requestParam.endPoint.stateToMethodType()) {
      case MainEndpointsType.post:
      case MainEndpointsType.get:
        return requestParam.requestBody.toString();
    }
  }
}
