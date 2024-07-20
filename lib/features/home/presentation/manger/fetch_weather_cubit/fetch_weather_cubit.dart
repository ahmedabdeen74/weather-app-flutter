import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';

part 'fetch_weather_state.dart';

class FetchWeatherCubit extends Cubit<FetchWeatherState> {
  FetchWeatherCubit(this.homeRepo) : super(WeatherInitial());
  final HomeRepo homeRepo;
  Future<void>getWeather({required String cityName}) async {
    emit(WeatherLoading());
    var result = await homeRepo.fetchWeatherForecast(cityName: cityName);
    result.fold((failure) {
      emit(WeatherFailure(errMessage: failure.errMessage));
    },(weather) {
      emit(WeatherSuccess(weatherModel: weather));
    });
  }
}
