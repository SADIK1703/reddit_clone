import 'dart:convert';
import 'package:reddit_clone/feature/home_page/data/models/post_model.dart';

class ContentListModel {
  ContentListModel({
    this.after,
    this.dist,
    this.modhash,
    this.geoFilter,
    this.children,
    this.before,
  });

  final dynamic after;
  final int? dist;
  final String? modhash;
  final String? geoFilter;
  final List<PostModel>? children;
  final String? before;

  factory ContentListModel.fromRawJson(String str) => ContentListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContentListModel.fromJson(Map<String, dynamic> json) => ContentListModel(
        after: json["after"],
        dist: json["dist"],
        modhash: json["modhash"],
        geoFilter: json["geo_filter"],
        children: json["children"] != null
            ? List<PostModel>.from(json["children"].map((final x) => PostModel.fromRawJson(x)))
            : [],
        before: json["before"],
      );

  Map<String, dynamic> toJson() => {
        "after": after,
        "dist": dist,
        "modhash": modhash,
        "geo_filter": geoFilter,
        "children": children,
        "before": before,
      };
}
