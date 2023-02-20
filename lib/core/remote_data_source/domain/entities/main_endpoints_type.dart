enum MainEndpointsType {
  post,
  get,
}

extension MainEndpointsTypeHelper on MainEndpointsType {
  String get methodName {
    switch (this) {
      case MainEndpointsType.post:
        return "POST";
      case MainEndpointsType.get:
        return "GET";
    }
  }
}
