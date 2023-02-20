import 'package:reddit_clone/feature/home_page/data/models/media_source_model.dart';

class Media {
  Media({
    this.source,
    this.resolutions,
    this.id,
  });

  final MediaSourceModel? source;
  final List<MediaSourceModel>? resolutions;
  final String? id;
}
