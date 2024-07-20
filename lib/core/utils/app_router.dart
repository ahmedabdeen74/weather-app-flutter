import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/utils/service_locator.dart';
import 'package:weather_app/features/home/data/repos/home_repo_impl.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';
import 'package:weather_app/features/list/presentation/manger/cubit/fetch_weather_list_cubit.dart';
import 'package:weather_app/features/search/presentation/views/search_view.dart';
import 'package:weather_app/features/splash/presentation/views/splash_view.dart';
import 'package:weather_app/features/list/presentation/view/list_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';
  static const kListView = '/listView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kListView,
        builder: (context, state) => BlocProvider(
          create: (context) => FetchWeatherListCubit(getIt.get<HomeRepoImpl>()),
          child: const ListViewPage(),
        ),
      ),
    ],
  );
}
