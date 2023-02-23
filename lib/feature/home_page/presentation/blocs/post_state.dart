part of 'post_bloc.dart';

@immutable
abstract class PostListState {}

class PostListInitial extends PostListState {}

class PostListFetchingNewPage extends PostListState {
  final List<Post> postList = [];
  PostListFetchingNewPage({List<Post>? postList});
}

class PostListError extends PostListState {
  final String? errorMessage;
  PostListError({this.errorMessage});
}

class PostListLoaded extends PostListState {
  final List<Post> postList;

  PostListLoaded({required this.postList});
}
