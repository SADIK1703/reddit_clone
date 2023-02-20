import 'dart:convert';

import 'package:reddit_clone/feature/home_page/data/models/gildings_model.dart';
import 'package:reddit_clone/feature/home_page/data/models/media_source_model.dart';

class MediaModel {
  MediaModel({
    this.source,
    this.resolutions,
    this.variants,
    this.id,
  });

  final MediaSourceModel? source;
  final List<MediaSourceModel>? resolutions;
  final GildingsModel? variants;
  final String? id;

  factory MediaModel.fromRawJson(String str) => MediaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        source: json["source"] == null ? null : MediaSourceModel.fromJson(json["source"]),
        resolutions: json["resolutions"] == null
            ? []
            : List<MediaSourceModel>.from(json["resolutions"]!.map((x) => MediaSourceModel.fromJson(x))),
        variants: json["variants"] == null ? null : GildingsModel.fromJson(json["variants"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "resolutions": resolutions == null ? [] : List<dynamic>.from(resolutions!.map((x) => x.toJson())),
        "variants": variants?.toJson(),
        "id": id,
      };
}
