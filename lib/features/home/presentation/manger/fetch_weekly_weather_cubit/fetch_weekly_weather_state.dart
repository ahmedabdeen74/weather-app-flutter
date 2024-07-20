part of 'fetch_weekly_weather_cubit.dart';

sealed class FetchWeeklyWeatherState extends Equatable {
  const FetchWeeklyWeatherState();

  @override
  List<Object> get props => [];
}

final class FetchWeeklyWeatherInitial extends FetchWeeklyWeatherState {}

final class WeatherWeeklyLoading extends FetchWeeklyWeatherState {}

final class WeatherWeeklySuccess extends FetchWeeklyWeatherState {
  final List<WeatherModel> weather;

  const WeatherWeeklySuccess({required this.weather});
}

final class WeatherWeeklyFailure extends FetchWeeklyWeatherState {
  final String errMessage;

  const WeatherWeeklyFailure({required this.errMessage});
}
