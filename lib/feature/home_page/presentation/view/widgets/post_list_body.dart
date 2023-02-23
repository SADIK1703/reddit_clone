import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/app_constants.dart';
import 'package:reddit_clone/core/constants/style_constants/app_colors.dart';
import 'package:reddit_clone/core/constants/style_constants/app_text_styles.dart';
import 'package:reddit_clone/core/constants/text_constants/keys.dart';
import 'package:reddit_clone/core/init/dependency_injection.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/post.dart';
import 'package:reddit_clone/feature/home_page/presentation/blocs/post_bloc.dart';
import 'package:reddit_clone/feature/home_page/presentation/view/widgets/post_card.dart';
import 'package:reddit_clone/production/custom_widgets.dart/app_loading_gif.dart';

class PostListBody extends StatelessWidget {
  const PostListBody({Key? key, required this.postList}) : super(key: key);

  final List<Post> postList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      slivers: [
        SliverAppBar(
          key: key,
          backgroundColor: AppColors.semiBlack,
          leadingWidth: kToolbarHeight + MediaQuery.of(context).padding.top,
          elevation: 0,
          title: Text(
            AppConstants.appName,
            style: AppTextStyles().head(),
          ),
          centerTitle: true,
        ),
        CupertinoSliverRefreshControl(
          builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance, refreshIndicatorExtent) =>
              const Center(
            child: Hero(tag: Keys.loadingHeroKey, child: AppLoadingGif()),
          ),
          onRefresh: () async {
            dependencyInjector<PostListBloc>().add(RefreshPostList(postList: postList));
          },
        ),
        SliverToBoxAdapter(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: postList.length,
            itemBuilder: (context, index) {
              final Post currentPost = postList[index];
              return PostCard(currentPost: currentPost);
            },
            separatorBuilder: (context, index) => Container(height: 8, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
