// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:reddit_clone/core/remote_data_source/data/repo/pingpong_main_request_impl.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/request_params.dart';
import 'package:reddit_clone/core/remote_data_source/domain/usecases/pingpong_main_request.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/post.dart';
import 'package:reddit_clone/feature/home_page/domain/params/fetch_post_list_param.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PingpongMainRequest _mainRequest = PingpongMainRequest(PingpongMainRequestImpl());

  PostListBloc() : super(PostListInitial()) {
    on<FetchPostList>((event, emit) async {
      _mainRequest.call(RequestParams(endPoint: MainEndpoints.fetchPostList, requestBody: FetchPostListParam()));
    });
    on<RefreshPostList>((event, emit) {});
  }
}
