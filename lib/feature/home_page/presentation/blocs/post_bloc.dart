// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:reddit_clone/core/constants/text_constants/error_messages.dart';
import 'package:reddit_clone/core/failures/failure.dart';
import 'package:reddit_clone/core/remote_data_source/data/repo/pingpong_main_request_impl.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/main_endpoints.dart';
import 'package:reddit_clone/core/remote_data_source/domain/entities/request_params.dart';
import 'package:reddit_clone/core/remote_data_source/domain/usecases/pingpong_main_request.dart';
import 'package:reddit_clone/feature/home_page/data/models/content_list_model.dart';
import 'package:reddit_clone/feature/home_page/data/models/content_model.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/content.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/content_kind.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/post.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/top_post_list_time_span.dart';
import 'package:reddit_clone/feature/home_page/domain/params/fetch_post_list_param.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PingpongMainRequest _mainRequest = PingpongMainRequest(PingpongMainRequestImpl());

  PostListBloc() : super(PostListInitial()) {
    on<FetchPostList>(
      (event, emit) async {
        emit(PostListFetchingNewPage());
        final responseEither = await _mainRequest.call(
          RequestParams(
            endPoint: MainEndpoints.fetchPostList,
            requestBody: FetchPostListParam(timeSpan: TopPostListTimeSpan.all).toMap(),
          ),
        );
        responseEither.fold(
          (final Failure failure) => emit(PostListError(errorMessage: failure.errorMessage)),
          (String data) {
            if (data.isEmpty) {
              emit(PostListError(errorMessage: ErrorMessages.unexpectedError));
            } else {
              try {
                ContentModel baseContentModel = ContentModel.fromRawJson(data);
                ContentListModel? contentListModel;
                if (baseContentModel.data is ContentListModel) {
                  contentListModel = baseContentModel.data as ContentListModel;
                }
                if (state is PostListLoaded) {
                  final PostListLoaded currentState = state as PostListLoaded;
                  final List<Content> contentList = contentListModel?.children ?? [];
                  final List<Post> postList = contentList
                      .where((content) => content.kind == ContentKind.link)
                      .map((content) => content.data)
                      .whereType<Post>()
                      .toList();
                  emit(PostListLoaded(postList: List.from(currentState.postList)..addAll(postList)));
                }
              } catch (e) {
                emit(PostListError(errorMessage: e.toString()));
              }
            }
          },
        );
      },
    );
    on<RefreshPostList>((event, emit) async {
      emit(PostListInitial());
      final responseEither = await _mainRequest.call(
        RequestParams(
          endPoint: MainEndpoints.fetchPostList,
          requestBody: FetchPostListParam(timeSpan: TopPostListTimeSpan.all).toMap(),
        ),
      );
      responseEither.fold(
        (final Failure failure) => emit(PostListError(errorMessage: failure.errorMessage)),
        (String data) {
          if (data.isEmpty) {
            emit(PostListError(errorMessage: ErrorMessages.unexpectedError));
          } else {
            try {
              ContentModel baseContentModel = ContentModel.fromRawJson(data);
              ContentListModel? contentListModel;
              if (baseContentModel.data is ContentListModel) {
                contentListModel = baseContentModel.data as ContentListModel;
              }
              final List<Content> contentList = contentListModel?.children ?? [];
              final List<Post> postList = contentList
                  .where((content) => content.kind == ContentKind.link)
                  .map((content) => content.data)
                  .whereType<Post>()
                  .toList();
              emit(PostListLoaded(postList: postList));
            } catch (e) {
              emit(PostListError(errorMessage: e.toString()));
            }
          }
        },
      );
    });
  }
}
