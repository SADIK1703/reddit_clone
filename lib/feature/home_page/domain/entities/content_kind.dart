// Write according to https://www.reddit.com/dev/api#GET_top

enum ContentKind {
  listing("Listing"),
  comment('t1'),
  account('t2'),
  link('t3'),
  message('t4'),
  subreddit('t5'),
  award('t6');

  final String parametricId;
  const ContentKind(this.parametricId);
}

extension ContentKindHelper on ContentKind {
  static ContentKind getContentKindByParametricId(final String id) {
    return ContentKind.values.firstWhere(
      (element) => element.parametricId == id,
      orElse: () => ContentKind.link,
    );
  }
}
