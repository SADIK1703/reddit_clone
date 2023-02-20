import 'package:reddit_clone/feature/home_page/data/models/preview_model.dart';

class Post {
  Post({
    this.selftext,
    this.saved,
    this.title,
    this.subredditNamePrefixed,
    this.downs,
    this.hideScore,
    this.name,
    this.linkFlairTextColor,
    this.subredditType,
    this.ups,
    this.linkFlairText,
    this.thumbnail,
    this.linkFlairType,
    this.preview,
    this.linkFlairBackgroundColor,
    this.author,
    this.numComments,
    this.createdUtc,
  });
  final String? selftext;
  final bool? saved;
  final String? title;
  final String? subredditNamePrefixed;
  final int? downs;
  final bool? hideScore;
  final String? name;
  final String? linkFlairTextColor;
  final String? subredditType;
  final int? ups;
  final String? linkFlairText;
  final String? thumbnail;
  final String? linkFlairType;
  final PreviewModel? preview;
  final String? linkFlairBackgroundColor;
  final String? author;
  final int? numComments;
  final int? createdUtc;
}
