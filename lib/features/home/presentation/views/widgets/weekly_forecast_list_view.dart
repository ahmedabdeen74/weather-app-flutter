import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/widgets/custom_error_widget.dart';
import 'package:weather_app/core/widgets/custom_loading_indicator.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_weekly_weather_cubit/fetch_weekly_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_weekly_forecast_item.dart';

class WeeklyForecastListView extends StatefulWidget {
  const WeeklyForecastListView({super.key});

  @override
  State<WeeklyForecastListView> createState() => _WeeklyForecastListViewState();
}

class _WeeklyForecastListViewState extends State<WeeklyForecastListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchWeeklyWeatherCubit, FetchWeeklyWeatherState>(
      builder: (context, state) {
        if (state is WeatherWeeklySuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.builder(
                itemCount: state.weather.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final String dateString =
                  state.weather[index].forecast?.forecastday?[0].date ?? '';
                  final DateTime date = DateTime.parse(dateString);
                  final String dayOfWeek = DateFormat('EEE').format(date);
                  return GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: CustomWeeklyForecastItem(
                      day: index==0?'Today':dayOfWeek,
                      weekWeatherModel:state.weather[index],
                      isActive: currentIndex == index,
                    ),
                  );
                }),
          );
        } else if (state is WeatherWeeklyFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
