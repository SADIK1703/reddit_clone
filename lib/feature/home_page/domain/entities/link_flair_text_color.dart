enum LinkFlairTextColor { light, dark }

extension LinkFlairTextColorHelper on LinkFlairTextColor {
  static LinkFlairTextColor getColorFromParametricValue(String? value) {
    if (value?.isNotEmpty ?? false) {
      if (value == "dark") {
        return LinkFlairTextColor.dark;
      } else {
        return LinkFlairTextColor.light;
      }
    } else {
      return LinkFlairTextColor.light;
    }
  }
}
