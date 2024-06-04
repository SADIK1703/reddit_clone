import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/style_constants/app_colors.dart';
import 'package:reddit_clone/core/constants/style_constants/app_text_styles.dart';
import 'package:reddit_clone/feature/home_page/domain/entities/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.semiBlack,
      appBar: AppBar(
        title: Text(post.subredditNamePrefixed ?? 'Reddit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (post.title != null)
              Text(
                post.title!,
                style: AppTextStyles().text().copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            const SizedBox(height: 10),
            if (post.author != null)
              Text(
                'Posted by ${post.author}',
                style: AppTextStyles().text().copyWith(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            const SizedBox(height: 10),
            if (post.preview != null &&
                (post.preview!.images?.isNotEmpty ?? false) &&
                post.preview!.images![0].source?.url != null)
              Image.network(post.preview!.images![0].source!.url!),
            const SizedBox(height: 10),
            if (post.selftext != null)
              Text(
                post.selftext!,
                style: AppTextStyles().text(),
              ),
            const SizedBox(height: 10),
            if (post.url != null)
              GestureDetector(
                onTap: () {
                  // Open URL logic can be implemented here.
                },
                child: Text(
                  post.url!,
                  style: AppTextStyles().text().copyWith(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.thumb_up, color: Colors.green),
                const SizedBox(width: 5),
                Text(post.ups?.toString() ?? '0'),
                const SizedBox(width: 20),
                const Icon(Icons.thumb_down, color: Colors.red),
                const SizedBox(width: 5),
                Text(post.downs?.toString() ?? '0'),
              ],
            ),
            const SizedBox(height: 10),
            if (post.numComments != null) Text('Comments: ${post.numComments}'),
            if (post.createdUtc != null) Text('Posted on: ${post.createdUtc}'),
          ],
        ),
      ),
    );
  }
}
