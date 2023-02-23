import 'package:get_it/get_it.dart';
import 'package:reddit_clone/feature/home_page/presentation/blocs/post_bloc.dart';

final dependencyInjector = GetIt.instance;

Future<void> init() async {
  //! HomePage
  //* Bloc
  dependencyInjector.registerLazySingleton<PostListBloc>(
    () => PostListBloc()..add(const RefreshPostList(postList: [])),
  );
}
