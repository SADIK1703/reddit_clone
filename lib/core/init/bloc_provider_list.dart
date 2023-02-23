import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/init/dependency_injection.dart';
import 'package:reddit_clone/feature/home_page/presentation/blocs/post_bloc.dart';

class MainProvider {
  final List<BlocProvider> blocList = [
    BlocProvider<PostListBloc>(
      create: (context) => dependencyInjector<PostListBloc>(),
    ),
  ];
}
