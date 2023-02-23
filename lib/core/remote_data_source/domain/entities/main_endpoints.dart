import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints_type.dart';

enum MainEndpoints {
  fetchPostList('r/flutterdev/top.json');

  final String path;
  static const String hostPath = "https://www.reddit.com/";
  const MainEndpoints(this.path);
}

extension MainEndPointExtension on MainEndpoints {
  MainEndpointsType stateToMethodType() {
    switch (this) {
      case MainEndpoints.fetchPostList:
        return MainEndpointsType.get;
    }
  }
}
