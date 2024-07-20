part of 'fetch_hourly_weather_cubit.dart';

sealed class FetchHourlyWeatherState extends Equatable {
  const FetchHourlyWeatherState();

  @override
  List<Object> get props => [];
}

final class FetchHourlyWeatherInitial extends FetchHourlyWeatherState {}

final class WeatherHourlySLoading extends FetchHourlyWeatherState {}

final class WeatherHourlySuccess extends FetchHourlyWeatherState {
  final List<HourWeatherModel> weather;

  const WeatherHourlySuccess({required this.weather});
}

final class WeatherHourlyFailure extends FetchHourlyWeatherState {
  final String errMessage;

  const WeatherHourlyFailure({required this.errMessage});
}
