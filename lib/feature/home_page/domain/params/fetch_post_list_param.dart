import 'dart:convert';

import 'package:reddit_clone/feature/home_page/domain/entities/top_post_list_time_span.dart';

class FetchPostListParam {
  final TopPostListTimeSpan? timeSpan;
  final String? after;
  final String? before;
  final int count;
  final int limit;
  final bool show;
  final bool srDetail;

  FetchPostListParam({
    required this.timeSpan,
    required this.after,
    required this.before,
    this.count = 0,
    this.limit = 25,
    this.show = false,
    this.srDetail = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeSpan': timeSpan?.mapValue,
      'after': after,
      'before': before,
      'count': count,
      'limit': limit,
      'show': show,
      'srDetail': srDetail,
    };
  }

  factory FetchPostListParam.fromMap(Map<String, dynamic> map) {
    return FetchPostListParam(
      timeSpan: map['timeSpan'] != null ? TopPostListTimeSpan.fromString(map['timeSpan']) : null,
      after: map['after'] != null ? map['after'] as String : null,
      before: map['before'] != null ? map['before'] as String : null,
      count: map['count'] as int,
      limit: map['limit'] as int,
      show: map['show'] as bool,
      srDetail: map['srDetail'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchPostListParam.fromJson(String source) =>
      FetchPostListParam.fromMap(json.decode(source) as Map<String, dynamic>);
}
