import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/core/widgets/custom_app_bar.dart';
import 'package:weather_app/core/widgets/custom_text_field.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_hourly_weather_cubit/fetch_hourly_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_weather_cubit/fetch_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_weekly_weather_cubit/fetch_weekly_weather_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: LottieBuilder.asset(AssetsData.kAnimation2),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Add your city !',
                  style: Styles.textStyle20,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  vertical: 32,
                  horizontal: 16,
                  radius: 16,
                  onSubmitted: (data) {
                    BlocProvider.of<FetchWeatherCubit>(context)
                        .getWeather(cityName: data);
                    BlocProvider.of<FetchHourlyWeatherCubit>(context)
                        .getHourlyWeather(cityName: data);
                    BlocProvider.of<FetchWeeklyWeatherCubit>(context)
                        .getWeeklyWeather(cityName: data);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
