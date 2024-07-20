import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/widgets/custom_error_home_view.dart';
import 'package:weather_app/core/widgets/custom_loading_home_view.dart';
import 'package:weather_app/features/home/presentation/manger/fetch_weather_cubit/fetch_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/back_ground_image.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_draggable_scrollable_sheet.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_weather_info.dart';
import 'package:weather_app/features/home/presentation/views/widgets/house_back_ground_image.dart';
import 'package:weather_app/features/home/presentation/views/widgets/no_weather_home_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchWeatherCubit, FetchWeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return const NoWeatherHomeBody();
        } else if (state is WeatherSuccess) {
          return
          Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Stack(
              children: [
                const BackGroundImage(),
                const Center(child: HouseBackGroundImage()),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 10),
                      child:
                          CustomWeatherInfo(weatherModel: state.weatherModel)),
                ),
                const CustomDraggableScrollableSheet()
              ],
            ),
          );
        } else if (state is WeatherFailure) {
          return CustomErrorHomeView(errMessage: state.errMessage);
        } else {
          return const CustomLoadingHomeView();
        }
      },
    );
  }
}
