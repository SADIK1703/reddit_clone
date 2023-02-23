import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/asset_constants/gif_assets.dart';

class AppLoadingGif extends StatelessWidget {
  const AppLoadingGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      GifAssets.loadingGif,
      colorBlendMode: BlendMode.difference,
    );
  }
}
