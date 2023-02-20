import 'package:flutter/cupertino.dart';
import 'package:reddit_clone/feature/home_page/ui/default_widgets/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, dynamic) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: ScrollController(),
          slivers: [
            DefaultAppBar(),
            CupertinoSliverRefreshControl(
              onRefresh: () async {},
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(),
              ),
            ),
          ],
        );
      },
    );
  }
}
