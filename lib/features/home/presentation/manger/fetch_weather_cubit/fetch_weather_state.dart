part of 'fetch_weather_cubit.dart';

sealed class FetchWeatherState extends Equatable {
  const FetchWeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends FetchWeatherState {}
final class WeatherLoading extends FetchWeatherState {}
final class WeatherSuccess extends FetchWeatherState {
  final WeatherModel weatherModel;

  const WeatherSuccess({required this.weatherModel});
}

final class WeatherFailure extends FetchWeatherState {
  final String errMessage;

  const WeatherFailure({required this.errMessage});
}
