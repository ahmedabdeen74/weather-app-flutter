import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';

class CustomWeeklyForecastItem extends StatelessWidget {
  const CustomWeeklyForecastItem(
      {super.key, required this.isActive, required this.weekWeatherModel, required this.day});
  final bool isActive;
  final WeatherModel weekWeatherModel;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .15,
            decoration: BoxDecoration(
                border:
                    Border.all(color: isActive ? kWhiteColor : kPrimaryColor),
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(32)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //'${DateTime.parse('${weekWeatherModel.forecast!.forecastday![0].date}').day}',
                  day,
                  style: Styles.textStyle16.copyWith(color: kWhiteColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  '${weekWeatherModel.forecast!.forecastday![0].day!.condition!.icon}',
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${weekWeatherModel.forecast!.forecastday![0].day!.avgtempC!.round().toString()} C°',
                  style: Styles.textStyle16.copyWith(color: kWhiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
