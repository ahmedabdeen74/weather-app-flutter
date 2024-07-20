import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';
class WeatherListViewItem extends StatelessWidget {
  const WeatherListViewItem({
    super.key,
    required this.weatherModel,
    this.onPressed,
  });
  final WeatherModel weatherModel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.height*.01),
            child: ClipRRect(
              child: Image.asset(
                AssetsData.kContainerListView,
                //height:MediaQuery.of(context).size.height*.42 //210,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *.06,
                    left: MediaQuery.of(context).size.height *.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weatherModel.current!.feelslikeC!.round().toString()}°',
                      style: Styles.textStyle20.copyWith(
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        'H:${weatherModel.forecast!.forecastday![0].day!.maxtempC!.round().toString()}°   L:${weatherModel.forecast!.forecastday![0].day!.mintempC!.round().toString()}°',
                        style: Styles.textStyle16),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${weatherModel.location!.name.toString()}, ${weatherModel.location!.country.toString()}',
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*.01),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        weatherModel.current!.condition!.icon.toString(),
                        height: MediaQuery.of(context).size.height*.13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      weatherModel.current!.condition!.text.toString(),
                      style: Styles.textStyle16.copyWith(
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height*.13),
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.cancel,
                    color: kGreyColor,
                  ),
                ),
                
              ),
             
            ],
          ),
        ],
      ),
    );
  }
}
