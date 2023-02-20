import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints_type.dart';

enum MainEndpoints {
  fetchHomePageList('r/flutterdev/top.json');

  final String path;
  const MainEndpoints(this.path);
}

extension MainEndPointExtension on MainEndpoints {
  MainEndpointsType stateToMethodType() {
    switch (this) {
      case MainEndpoints.fetchHomePageList:
        return MainEndpointsType.get;
    }
  }
}
