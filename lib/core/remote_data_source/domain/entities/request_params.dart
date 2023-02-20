import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints.dart';

class RequestParams {
  final MainEndpoints endPoint;
  final Map<String, dynamic>? requestBody;

  RequestParams({
    required this.endPoint,
    this.requestBody,
  });
}
