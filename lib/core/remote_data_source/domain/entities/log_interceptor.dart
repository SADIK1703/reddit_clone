import 'package:dio/dio.dart';
import 'package:reddit_clone/core/constants/service_constants/debug_request_print_constants.dart';
import 'package:reddit_clone/core/functions/colorful_print_by_debug_label_type.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints.dart';

class CustomLogInterceptor extends LogInterceptor {
  CustomLogInterceptor({
    super.requestBody = true,
    super.responseBody = true,
  });

  @override
  void onRequest(final RequestOptions options, final RequestInterceptorHandler handler) {
    logPrint('*** Request ***');
    _printKV('uri', options.uri, DebugLabelType.warning);
    _printKV(
      'endpoint',
      MainEndpoints.values.firstWhere(
        (final element) => options.path.contains(element.path),
      ),
      DebugLabelType.warning,
    );
    //options.headers;

    if (request) {
      _printKV('method', options.method, DebugLabelType.warning);
      _printKV('responseType', options.responseType.toString(), DebugLabelType.warning);
      _printKV('followRedirects', options.followRedirects, DebugLabelType.warning);
      _printKV('connectTimeout', options.connectTimeout, DebugLabelType.warning);
      _printKV('sendTimeout', options.sendTimeout, DebugLabelType.warning);
      _printKV('receiveTimeout', options.receiveTimeout, DebugLabelType.warning);
      _printKV('receiveDataWhenStatusError', options.receiveDataWhenStatusError, DebugLabelType.warning);
      _printKV('extra', options.extra, DebugLabelType.warning);
    }
    if (requestHeader) {
      logPrint('headers:');
      options.headers.forEach((final key, final v) => _printKV(key, v, DebugLabelType.warning));
    }
    if (requestBody) {
      logPrint('data:');
      _printAll(options.data, DebugLabelType.warning);
    }
    logPrint('');

    handler.next(options);
  }

  @override
  void onResponse(final Response response, final ResponseInterceptorHandler handler) {
    logPrint('*** Response ***');
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  void _printResponse(final Response response) {
    _printKV('uri', response.requestOptions.uri, DebugLabelType.success);
    if (responseHeader) {
      _printKV('statusCode', response.statusCode, DebugLabelType.success);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri, DebugLabelType.success);
      }

      logPrint('headers:');
      response.headers.forEach((final key, final v) => _printKV(' $key', v.join('\r\n\t'), DebugLabelType.success));
    }
    if (responseBody) {
      logPrint('Response Text:');
      _printAll(response.toString(), DebugLabelType.success);
    }
    logPrint('');
  }

  void _printKV(final String key, final Object? v, final DebugLabelType debugLabelType) {
    colorfulPrintByDebugLabelType({'$key: $v'}, debugLabelType);
  }

  void _printAll(final msg, final DebugLabelType debugLabelType) {
    msg.toString().split('\n').forEach(
      (final object) {
        if (object.toString().length != DebugRequestPrintConstants.maxResponseValueLenth) {
          colorfulPrintByDebugLabelType(object, debugLabelType);
        } else {
          colorfulPrintByDebugLabelType(
            "${object.split(':').first}: {You can get data by increase DebugRequestPrintConstants.maxResponseValueLenth}",
            debugLabelType,
          );
        }
      },
    );
  }
}
