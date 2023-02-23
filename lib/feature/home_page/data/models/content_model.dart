import 'dart:convert';

import 'package:reddit_clone/feature/home_page/data/models/content_list_model.dart';
import 'package:reddit_clone/feature/home_page/data/models/post_model.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/content.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/content_kind.dart';

class ContentModel implements Content {
  ContentModel({
    this.kind,
    this.data,
  });

  @override
  final ContentKind? kind;
  @override
  final ContentDataModel? data;

  factory ContentModel.fromRawJson(String str) => ContentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    ContentDataModel? data;
    ContentKind kind = ContentKindHelper.getContentKindByParametricId(json["kind"]);

    if (kind == ContentKind.link) {
      data = PostModel.fromJson(json["data"]);
    }

    if (kind == ContentKind.listing) {
      data = ContentListModel.fromJson(json["data"]);
    }

    return ContentModel(
      kind: kind,
      data: data ?? (json["data"] == null ? null : ContentDataModel.fromJson(json["data"])),
    );
  }

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "data": data?.toJson(),
      };
}

class ContentDataModel {
  ContentDataModel();

  factory ContentDataModel.fromRawJson(String str) => ContentDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContentDataModel.fromJson(Map<String, dynamic> json) => ContentDataModel();

  Map<String, dynamic> toJson() => {};
}
