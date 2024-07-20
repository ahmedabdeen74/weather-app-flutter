import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/home/data/models/hour_weather/hour_weather_model.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';
abstract class HomeRepo {
  Future<Either<Failure,WeatherModel>>fetchWeatherForecast(
    {required String cityName
  });
  Future<Either<Failure,List<HourWeatherModel>>> fetchHourlyForecast(
    {required String cityName
  });
  Future<Either<Failure,List<WeatherModel>>> fetchWeeklyForecast(
      {required String cityName});
}
