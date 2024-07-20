import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/custom_app_bar.dart';
import 'package:weather_app/core/widgets/custom_text_field.dart';
import 'package:weather_app/features/list/presentation/manger/cubit/fetch_weather_list_cubit.dart';
import 'package:weather_app/features/list/presentation/view/widgets/weather_list_view.dart';

class CustomListViewBody extends StatefulWidget {
  const CustomListViewBody({super.key});

  @override
  State<CustomListViewBody> createState() => _CustomListViewBodyState();
}

class _CustomListViewBodyState extends State<CustomListViewBody> {
  final TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const CustomAppBar(),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomTextField(
            controller: cityController,
            vertical: 4,
            horizontal: 12,
            radius: 2,
            onSubmitted: (data) {
              BlocProvider.of<FetchWeatherListCubit>(context)
                  .getWeatherList(cityName: data);
              cityController.clear();
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: WeatherListView(),
        ),
      ]),
    );
  }
}
