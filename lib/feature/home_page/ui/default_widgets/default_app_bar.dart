import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/app_constants.dart';
import 'package:reddit_clone/core/constants/style_constants/app_colors.dart';
import 'package:reddit_clone/core/constants/style_constants/app_text_styles.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({Key? key}):super(
          key: key,
          backgroundColor: AppColors.semiBlack,
          leadingWidth: kToolbarHeight, // 56 default değerdir.
          elevation: 0,
          title: 
              Text(
                  AppConstants.appName,
                  style: AppTextStyles().head(),
                ),
          centerTitle: true,
        );
}
