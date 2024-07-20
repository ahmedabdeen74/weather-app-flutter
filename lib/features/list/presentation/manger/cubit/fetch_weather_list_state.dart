part of 'fetch_weather_list_cubit.dart';

abstract class FetchWeatherListEvent {}

class GetWeatherList extends FetchWeatherListEvent {
  final String cityName;

  GetWeatherList(this.cityName);
}

// States
abstract class FetchWeatherListState extends Equatable {
  const FetchWeatherListState();

  @override
  List<Object> get props => [];
}

class FetchWeatherListInitial extends FetchWeatherListState {}

class WeatherListLoading extends FetchWeatherListState {}

class WeatherListSuccess extends FetchWeatherListState {
  final List<WeatherModel> weatherList;

  const WeatherListSuccess({required this.weatherList});

  @override
  List<Object> get props => [weatherList];
}

class WeatherListFailure extends FetchWeatherListState {
  final String errorMessage;

  const WeatherListFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}