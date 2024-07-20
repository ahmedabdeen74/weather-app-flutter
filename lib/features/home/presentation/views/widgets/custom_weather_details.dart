import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/core/widgets/custom_error_widget.dart';
import 'package:weather_app/core/widgets/custom_loading_indicator.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_weather_cubit/fetch_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_air_quality.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_item_weather.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_pressure_wind.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_uv_index.dart';

class CustomWeatherDetails extends StatelessWidget {
  const CustomWeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchWeatherCubit, FetchWeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Column(
            children: [
              CustomAirQuality(
                airQualityValue: state
                    .weatherModel.current!.airQuality!.usEpaIndex!
                    .toString(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomUvIndex(
                    uvIndexValue:
                        state.weatherModel.current!.uv!.round().toString(),
                    uvIndexCondition:
                        state.weatherModel.current!.condition!.text!,
                  ),
                  CustomItemWeather(
                    itemPhoto: AssetsData.kSunRise,
                    itemName: 'SUNRISE',
                    itemNumber: state
                        .weatherModel.forecast!.forecastday![0].astro!.sunrise!,
                    itemDetail:
                        'Sunset: ${state.weatherModel.forecast!.forecastday![0].astro!.sunset}',
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPressureWindItem(
                    itemName: 'WIND',
                    itemNumber: state.weatherModel.current!.windKph!.round().toString(),
                    itemUnit: 'km',
                  ),
                  CustomItemWeather(
                    itemPhoto: AssetsData.kSnow,
                    itemName: 'Chance of rain',
                    itemNumber:
                        '${state.weatherModel.forecast!.forecastday![0].hour![0].chanceOfRain.toString()}%',
                    itemDetail: 'in last hour',
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomItemWeather(
                    itemPhoto: AssetsData.kFeelsLike,
                    itemName: 'FEELS LIKE',
                    itemNumber:
                        '${state.weatherModel.current!.feelslikeC!.round().toString()}°',
                    itemDetail: 'similar to the actual temperature',
                    fontSize: 12,
                  ),
                  CustomItemWeather(
                    itemPhoto: AssetsData.kHumidity,
                    itemName: 'Humidity',
                    itemNumber:
                        '${state.weatherModel.current!.humidity.toString()}%',
                    itemDetail:
                        'the dew point is ${state.weatherModel.forecast!.forecastday![0].hour![0].dewpointC!.round().toString()} right now',
                    fontSize: 12,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.01,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomItemWeather(
                    itemPhoto: AssetsData.kVisibility,
                    itemName: 'Visibility',
                    itemNumber: '${state.weatherModel.current!.visKm!.round().toString()} Km',
                    itemDetail: 'similar to the actual temperature',
                    fontSize: 12,
                  ),
                  CustomPressureWindItem(
                    itemName: 'PRESSURE',
                    itemNumber: state.weatherModel.current!.pressureMb!.round().toString(),
                    itemUnit: 'mb',
                  ),
                ],
              ),
            ],
          );
        } else if (state is WeatherFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
