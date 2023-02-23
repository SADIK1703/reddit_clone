import 'package:reddit_clone/feature/home_page/data/models/content_model.dart';

class ContentList {
  ContentList({
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
  final List<ContentModel>? children;
  final String? before;
}
