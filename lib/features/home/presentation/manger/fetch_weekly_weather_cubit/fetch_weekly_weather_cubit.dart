import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';
part 'fetch_weekly_weather_state.dart';
class FetchWeeklyWeatherCubit extends Cubit<FetchWeeklyWeatherState> {
  FetchWeeklyWeatherCubit(this.homeRepo) : super(FetchWeeklyWeatherInitial());
   final HomeRepo homeRepo;
  Future<void>getWeeklyWeather({required String cityName}) async {
    emit(WeatherWeeklyLoading());
    var result = await homeRepo.fetchWeeklyForecast(cityName: cityName);
    result.fold((failure) {
      emit(WeatherWeeklyFailure(errMessage: failure.errMessage));
    },(weather) {
      emit(WeatherWeeklySuccess(weather: weather));
    });
  }
}
