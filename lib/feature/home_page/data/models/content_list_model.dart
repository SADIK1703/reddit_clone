import 'dart:convert';
import 'package:reddit_clone/feature/home_page/data/models/content_model.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/content_list.dart';

class ContentListModel implements ContentList, ContentDataModel {
  ContentListModel({
    this.after,
    this.dist,
    this.modhash,
    this.geoFilter,
    this.children,
    this.before,
  });

  @override
  final dynamic after;
  @override
  final int? dist;
  @override
  final String? modhash;
  @override
  final String? geoFilter;
  @override
  final List<ContentModel>? children;
  @override
  final String? before;

  factory ContentListModel.fromRawJson(String str) => ContentListModel.fromJson(json.decode(str));

  @override
  String toRawJson() => json.encode(toJson());

  factory ContentListModel.fromJson(Map<String, dynamic> json) => ContentListModel(
        after: json["after"],
        dist: json["dist"],
        modhash: json["modhash"],
        geoFilter: json["geo_filter"],
        children: json["children"] != null
            ? List<ContentModel>.from(json["children"].map((final x) => ContentModel.fromJson(x)))
            : [],
        before: json["before"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "after": after,
        "dist": dist,
        "modhash": modhash,
        "geo_filter": geoFilter,
        "children": children,
        "before": before,
      };
}
