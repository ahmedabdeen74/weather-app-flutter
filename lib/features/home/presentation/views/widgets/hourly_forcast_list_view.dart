import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/custom_error_widget.dart';
import 'package:weather_app/core/widgets/custom_loading_indicator.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_hourly_weather_cubit/fetch_hourly_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_hourly_forecast_item.dart';

class HourlyForecastListView extends StatefulWidget {
  const HourlyForecastListView({super.key});

  @override
  State<HourlyForecastListView> createState() => _HourlyForecastListViewState();
}

class _HourlyForecastListViewState extends State<HourlyForecastListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHourlyWeatherCubit, FetchHourlyWeatherState>(
      builder: (context, state) {
        if (state is WeatherHourlySuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height*.17,
            child: ListView.builder(
                itemCount: state.weather.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: CustomHourlyForecastItem(
                      hourWeatherModel: state.weather[index],
                      isActive: currentIndex == index,
                    ),
                  );
                }),
          );
        } else if (state is WeatherHourlyFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
