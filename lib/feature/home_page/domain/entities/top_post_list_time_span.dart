enum TopPostListTimeSpan {
  hour("hour"),
  day("day"),
  week("week"),
  month("month"),
  year("year"),
  all("all");

  final String mapValue;
  static TopPostListTimeSpan? fromString(String json) {
    try {
      TopPostListTimeSpan.values.firstWhere((element) => element.mapValue == json);
    } catch (e) {
      return null;
    }
  }

  const TopPostListTimeSpan(this.mapValue);
}
