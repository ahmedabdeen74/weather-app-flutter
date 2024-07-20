import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/custom_error_widget.dart';
import 'package:weather_app/features/list/presentation/manger/cubit/fetch_weather_list_cubit.dart';
import 'package:weather_app/features/list/presentation/view/widgets/weather_list_view_item.dart';

class WeatherListView extends StatefulWidget {
  const WeatherListView({super.key});

  @override
  State<WeatherListView> createState() => _WeatherListViewState();
}

class _WeatherListViewState extends State<WeatherListView> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchWeatherListCubit, FetchWeatherListState>(
      builder: (context, state) {
        if (state is WeatherListSuccess) {
          return ListView.builder(
              itemCount: state.weatherList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return WeatherListViewItem(
                  onPressed: () {
                    isPressed == true;
                    context
                        .read<FetchWeatherListCubit>()
                        .removeWeatherListItem(index);
                    setState(() {});
                  },
                  weatherModel: state.weatherList[index],
                );
              });
        } else if (state is WeatherListFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const Text('');
        }
      },
    );
  }
}



/*BlocBuilder<ReadWeatherListCubit,
        ReadWeatherListState>(
         builder: (context, state){
          List<WeatherListModel> recentSearches =
            BlocProvider.of<ReadWeatherListCubit>(context).readWeather ?? [];
          return ListView.builder(
              itemCount: recentSearches.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return WeatherListViewItem(
                  weatherListModel: recentSearches[index],
                );
              });
       
      },
    );*/
    