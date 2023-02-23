part of 'post_bloc.dart';

@immutable
abstract class PostListEvent extends Equatable {
  const PostListEvent();

  @override
  List<Post> get props => [];
}

class FetchPostList extends PostListEvent {
  final List<Post> postList;

  const FetchPostList({required this.postList});

  @override
  List<Post> get props => postList;
}

class RefreshPostList extends PostListEvent {
  final List<Post> postList;

  const RefreshPostList({required this.postList});

  @override
  List<Post> get props => postList;
}
