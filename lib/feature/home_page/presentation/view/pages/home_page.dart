import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/style_constants/app_colors.dart';
import 'package:reddit_clone/core/constants/text_constants/error_messages.dart';
import 'package:reddit_clone/core/constants/text_constants/keys.dart';
import 'package:reddit_clone/feature/home_page/presentation/blocs/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/feature/home_page/presentation/view/widgets/post_list_body.dart';
import 'package:reddit_clone/production/custom_widgets.dart/app_loading_gif.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.semiBlack,
      body: BlocBuilder<PostListBloc, PostListState>(
        builder: (context, state) {
          if (state is PostListInitial) {
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 24 / 100,
                width: MediaQuery.of(context).size.width * 24 / 100,
                child: const Hero(tag: Keys.loadingHeroKey, child: AppLoadingGif()),
              ),
            );
          }
          if (state is PostListFetchingNewPage) {
            return Column(
              children: [
                PostListBody(postList: state.postList),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 24 / 100,
                    width: MediaQuery.of(context).size.width * 24 / 100,
                    child: const Hero(tag: Keys.loadingHeroKey, child: AppLoadingGif()),
                  ),
                ),
              ],
            );
          }
          if (state is PostListError) {
            return Center(child: Text(state.errorMessage ?? ErrorMessages.unexpectedError));
          }
          if (state is PostListLoaded) {
            return PostListBody(postList: state.postList);
          } else {
            return const Center(child: Text(ErrorMessages.unexpectedError));
          }
        },
      ),
    );
  }
}
