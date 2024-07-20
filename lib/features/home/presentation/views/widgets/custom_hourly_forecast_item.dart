import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/data/models/hour_weather/hour_weather_model.dart';
class CustomHourlyForecastItem extends StatelessWidget {
  const CustomHourlyForecastItem(
      {super.key, required this.isActive, required this.hourWeatherModel});
  final bool isActive;
  final HourWeatherModel hourWeatherModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*.15,
            decoration: BoxDecoration(
                border: Border.all(
                  color: isActive ? kWhiteColor : kPrimaryColor,
                ),
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(32)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
             '${DateTime.parse(hourWeatherModel.hour).hour} : 0${DateTime.parse(hourWeatherModel.hour).minute}',
                  style: Styles.textStyle16.copyWith(color: kWhiteColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  hourWeatherModel.imageName,
                  height: MediaQuery.of(context).size.height *.06,
                  width: MediaQuery.of(context).size.width *0.2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${hourWeatherModel.avgTemp.round().toString()} C°',
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
