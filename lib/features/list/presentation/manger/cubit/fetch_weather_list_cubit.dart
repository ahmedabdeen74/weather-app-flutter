import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';

part 'fetch_weather_list_state.dart';

class FetchWeatherListCubit extends Cubit<FetchWeatherListState> {
  FetchWeatherListCubit(this.homeRepo) : super(FetchWeatherListInitial());
  final HomeRepo homeRepo;
  final List<WeatherModel> _weatherList = [];
  Future<void> getWeatherList({required String cityName}) async {
    emit(WeatherListLoading());

    final result = await homeRepo.fetchWeatherForecast(cityName: cityName);
    result.fold(
      (failure) {
        emit(WeatherListFailure(errorMessage: failure.errMessage));
      },
      (weatherModel) {
        _weatherList.insert(0, weatherModel);
        emit(WeatherListSuccess(weatherList: _weatherList));
      },
    );
  }

  void removeWeatherListItem(int index) {
    _weatherList.removeAt(index);
    emit(WeatherListSuccess(weatherList: _weatherList));
  }
  void deleteWeather(int index) {
    _weatherList.removeAt(index);
    emit(WeatherListSuccess(weatherList: List.from(_weatherList)));
  }
 /* void removeWeatherData(int index) {
    if (index >= 0 && index < _weatherList.length) {
      _weatherList.removeAt(index);
      emit(WeatherListSuccess(weatherList: _weatherList));
    }
  }*/
}
