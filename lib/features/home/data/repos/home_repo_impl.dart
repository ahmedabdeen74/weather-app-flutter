import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/utils/api_service.dart';
import 'package:weather_app/features/home/data/models/hour_weather/hour_weather_model.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';
class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, WeatherModel>> fetchWeatherForecast(
      {required String cityName}) async {
    try {
      var data = await apiService.get(
          endPoint:
              '/forecast.json?key=c34496ab0a47432288462202232211&q=$cityName&days=7&aqi=yes&alerts=yes');

      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return right(weatherModel);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }

  @override
  Future<Either<Failure,List<HourWeatherModel>>> fetchHourlyForecast(
      {required String cityName}) async {
    try {
      var data = await apiService.get(
          endPoint:
              '/forecast.json?key=c34496ab0a47432288462202232211&q=$cityName&days=1&aqi=yes&alerts=yes');
        var hour = data["forecast"]["forecastday"][0];
      List<HourWeatherModel> hourList = [];
       for (var  hourlyData in hour['hour']) {
       final weatherHour = HourWeatherModel.fromJson(json: hourlyData);
        hourList.add(weatherHour);
      }
      return right(hourList);

       
      
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }

  @override
  Future<Either<Failure, List<WeatherModel>>> fetchWeeklyForecast(
      {required String cityName}) async {
   try {
      var data = await apiService.get(
          endPoint:
              '/forecast.json?key=c34496ab0a47432288462202232211&q=$cityName&days=3&aqi=yes&alerts=yes');
     final List<dynamic> forecastdayList = data['forecast']['forecastday'];

        List<WeatherModel> weatherList = [];
        for (var forecastday in forecastdayList) {
          final weatherModel = WeatherModel.fromJson({
            'location': data['location'],
            'current': data['current'],
            'forecast': {'forecastday': [forecastday]},
            'alerts': data['alerts'],
          });
          weatherList.add(weatherModel);
        }

        return Right(weatherList);
      
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }

 
}

 /*@override
  Future<Either<Failure, List<WeatherModel>>> fetchHourlyForecast(
      {required String cityName}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'forecast.json?key=c34496ab0a47432288462202232211&q=$cityName&days=7');
      //List hour = data["forecast"]["forecastday"][0]["hour"];
      List<WeatherModel> hourList = [];
      for (int i = 0; i < 24; i++) {
        hourList.add(WeatherModel.fromJson(data["forecast"]["forecastday"][0]["hour"][i]));
      }
      return right(hourList);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }*/
  


 /* List<dynamic> forecastday = jsonData['forecast']['forecastday'];
      List<WeatherModel> hourlyWeather = [];

      for (var day in forecastday) {
        List<dynamic> hours = day['hour'];

        List<Hour> hourList = hours.map((hourData) {
          return Hour.fromJson(hourData);
        }).toList();

        Forecastday forecast = Forecastday(
          date: day['date'],
          day: Day.fromJson(day['day']),
          hour: hourList,
        );

        WeatherModel weatherModel = WeatherModel(
          location: Location.fromJson(jsonData['location']),
          forecastday: [forecast],
        );

        hourlyWeather.add(weatherModel);
      }

*/

      /*  @override
  Future<Either<Failure, List<WeatherModel>>> fetchHourlyForecast(
      {required String cityName}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'forecast.json?key=c34496ab0a47432288462202232211&q=$cityName&days=1');
      final hour = data["forecast"]["forecastday"][0];
      List<WeatherModel> hourList = [];
       for (final hourlyData in hour['hour']) {
       final weatherHour = WeatherModel.fromJson(hourlyData);
        hourList.add(weatherHour);
      }
      return right(hourList);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(errMessage: e.toString()));
  }*/



 /* 
 
 
 List<dynamic> forecastList = data['forecast']['forecastday'];
      List<WeatherModel> weather = [];
      for (var item in forecastList) {
        final weatherForecastResponse = WeatherModel.fromJson({
         // 'location': data['location'],
          //'current': data['current'],
          'forecast': {
            'forecastday':[item]
          },
        });
        weather.add(weatherForecastResponse);
      }
      return right(weather);*/