import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/home/data/models/hour_weather/hour_weather_model.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';

part 'fetch_hourly_weather_state.dart';

class FetchHourlyWeatherCubit extends Cubit<FetchHourlyWeatherState> {
  FetchHourlyWeatherCubit(this.homeRepo) : super(FetchHourlyWeatherInitial());
   final HomeRepo homeRepo;
  Future<void>getHourlyWeather({required String cityName}) async {
    emit(WeatherHourlySLoading());
    var result = await homeRepo.fetchHourlyForecast(cityName: cityName);
    result.fold((failure) {
      emit(WeatherHourlyFailure(errMessage: failure.errMessage));
    },(weather) {
      emit(WeatherHourlySuccess(weather: weather));
    });
  }
}
