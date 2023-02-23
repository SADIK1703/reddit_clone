import 'package:reddit_clone/feature/home_page/data/models/content_model.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/content_kind.dart';

class Content {
  Content({
    this.kind,
    this.data,
  });

  final ContentKind? kind;
  final ContentDataModel? data;
}
