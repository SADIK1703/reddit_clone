import 'package:dio/dio.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/request_params.dart';

class CustomInterceptor extends Interceptor {
  final RequestParams requestParams;

  CustomInterceptor(this.requestParams);

  @override
  Future<void> onError(final DioError err, final ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }

  @override
  void onResponse(final Response response, final ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onRequest(final RequestOptions options, final RequestInterceptorHandler handler) {
    final Map<String, dynamic> headers = {};

    options.data = requestParams.requestBody;
    options.headers = headers;
    options.responseType = ResponseType.plain;
    options.validateStatus = (final int? statusCode) => true;

    super.onRequest(options, handler);
  }
}
