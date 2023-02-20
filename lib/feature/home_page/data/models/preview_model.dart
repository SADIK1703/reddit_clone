import 'dart:convert';

import 'package:reddit_clone/feature/home_page/data/models/media_model.dart';

class PreviewModel {
  PreviewModel({
    this.images,
    this.enabled,
  });

  final List<MediaModel>? images;
  final bool? enabled;

  factory PreviewModel.fromRawJson(String str) => PreviewModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PreviewModel.fromJson(Map<String, dynamic> json) => PreviewModel(
        images: json["images"] == null ? [] : List<MediaModel>.from(json["images"]!.map((x) => MediaModel.fromJson(x))),
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "enabled": enabled,
      };
}
