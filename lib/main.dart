import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/app_router.dart';
import 'package:weather_app/core/utils/service_locator.dart';
import 'package:weather_app/features/home/data/repos/home_repo_impl.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_hourly_weather_cubit/fetch_hourly_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_weather_cubit/fetch_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_weekly_weather_cubit/fetch_weekly_weather_cubit.dart';
void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchWeatherCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              FetchHourlyWeatherCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              FetchWeeklyWeatherCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: BlocBuilder<FetchWeatherCubit, FetchWeatherState>(
        builder: (context, state) {
          return MaterialApp.router(
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            
          );
        },
      ),
    );
  }
}
