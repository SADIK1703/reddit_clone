import 'package:flutter/material.dart';

extension ColorHelper on Color {
  static Color? fromHexCode(String? hexCode) {
    if (hexCode == null || hexCode.length < 6) {
      return null;
    } else {
      return Color(int.parse(hexCode.replaceAll('#', '0xff')));
    }
  }
}
