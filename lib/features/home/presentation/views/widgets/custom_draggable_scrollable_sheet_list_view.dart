import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_weather_details.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_weather_forecast.dart';
import 'package:weather_app/features/home/presentation/views/widgets/weekly_forecast_list_view.dart';
import 'hourly_forcast_list_view.dart';

class CustomDraggableScrollableSheetListView extends StatefulWidget {
  const CustomDraggableScrollableSheetListView(
      {super.key, required this.controller});
  final ScrollController controller;

  @override
  State<CustomDraggableScrollableSheetListView> createState() =>
      _CustomDraggableScrollableSheetListViewState();
}
class _CustomDraggableScrollableSheetListViewState
    extends State<CustomDraggableScrollableSheetListView> {
      
  bool isHourlyForecast =true;
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
      controller: widget.controller,
      children: [
        CustomWeatherForecast(
          isHourlyForecast: isHourlyForecast,
          onTap1: () {
            isHourlyForecast = true;
            setState(() {});
          },
          onTap2: () {
            isHourlyForecast = false;
            setState((){
            });
          },
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height*.02,
        ),
        isHourlyForecast? const HourlyForecastListView():const WeeklyForecastListView(),
         SizedBox(
          height: MediaQuery.of(context).size.height*.03,
        ),
        const CustomWeatherDetails()
      
      ],
    );
  }
}
