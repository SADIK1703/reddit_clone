import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/style_constants/app_colors.dart';
import 'package:reddit_clone/core/constants/style_constants/app_text_styles.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/post.dart';
import 'package:reddit_clone/feature/home_page/presentation/helpers/time_difference_by_now.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.currentPost,
  }) : super(key: key);

  final Post currentPost;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.semiBlack,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (currentPost.author?.isNotEmpty ?? false)
              Text(
                currentPost.author! +
                    (currentPost.createdUtc != null ? '·${currentPost.createdUtc!.timeDifferenceByNow()}' : ''),
                style: AppTextStyles().text(),
              ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (currentPost.title?.isNotEmpty ?? false)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentPost.title!,
                          style: AppTextStyles().body(),
                        ),
                        const SizedBox(height: 4),
                        if ((currentPost.linkFlairText?.isNotEmpty ?? false) &&
                            currentPost.linkFlairBackgroundColor != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ColoredBox(
                              color: currentPost.linkFlairBackgroundColor!,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                                child: Text(
                                  currentPost.linkFlairText!,
                                  style: AppTextStyles().text(
                                    color: currentPost.linkFlairTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (currentPost.thumbnail != null)
                  Image.network(
                    currentPost.thumbnail!,
                    errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            if (currentPost.selftext?.isNotEmpty ?? false)
              Text(
                  currentPost.selftext!
                      .split('.')
                      .where((element) => !element.contains(']('))
                      .where((element) => !element.contains(')'))
                      .where((element) => !element.contains('['))
                      .join('.'),
                  style: AppTextStyles().text()),
          ],
        ),
      ),
    );
  }
}
