import 'dart:convert';

class GildingsModel {
  GildingsModel();

  factory GildingsModel.fromRawJson(String str) => GildingsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GildingsModel.fromJson(Map<String, dynamic> json) => GildingsModel();

  Map<String, dynamic> toJson() => {};
}
