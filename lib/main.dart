import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/constants/app_constants.dart';
import 'package:reddit_clone/core/init/bloc_provider_list.dart';
import 'package:reddit_clone/core/init/dependency_injection.dart' as dependency_injection;
import 'package:reddit_clone/feature/home_page/presentation/view/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection.init();
  await dependency_injection.dependencyInjector.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainProvider().blocList,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
