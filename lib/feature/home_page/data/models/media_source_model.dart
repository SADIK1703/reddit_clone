import 'dart:convert';

class MediaSourceModel {
  MediaSourceModel({
    this.url,
    this.width,
    this.height,
  });

  final String? url;
  final int? width;
  final int? height;

  factory MediaSourceModel.fromRawJson(String str) => MediaSourceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MediaSourceModel.fromJson(Map<String, dynamic> json) => MediaSourceModel(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
