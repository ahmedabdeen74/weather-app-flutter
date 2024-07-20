import 'package:weather_app/core/utils/function/weather_condition_image.dart';

class HourWeatherModel {
  final String hour;
  final double avgTemp;
  final String imageName;
  final String weatherCondition;

  HourWeatherModel({
    required this.hour,
    required this.avgTemp,
    required this.imageName,
    required this.weatherCondition,
  });

  factory HourWeatherModel.fromJson({required Map json}) {
    String weatherCondition = json["condition"]["text"];
    return HourWeatherModel(
      hour: json["time"],
      avgTemp: json["temp_c"],
      weatherCondition: weatherCondition, 
      imageName: weatherConditionImage(weatherCondition),
    );
  }
}