part of 'post_bloc.dart';

@immutable
abstract class PostListState {}

class PostListInitial extends PostListState {}

class PostListError extends PostListState {}

class PostListSuccess extends PostListState {}
