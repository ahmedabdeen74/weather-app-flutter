import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/data/models/weather/weather.model.dart';
class CustomWeatherInfo extends StatelessWidget {
  const CustomWeatherInfo({
    super.key, required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * .04),
                child: Text(
                  weatherModel.location!.name!,
                  style: GoogleFonts.roboto(textStyle: Styles.textStyle34),
                ),
              ),
              Text(
                '${weatherModel.current!.feelslikeC!.round().toString()}°',
                style: GoogleFonts.roboto(textStyle: Styles.textStyle96),
              ),
              Text(
                weatherModel.current!.condition!.text.toString(),
                style: GoogleFonts.roboto(
                  textStyle: Styles.textStyle20.copyWith(
                    color: Colors.white38,
                    height: 0.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'H:${weatherModel.forecast!.forecastday![0].day!.maxtempC!.round().toString()}°   L:${weatherModel.forecast!.forecastday![0].day!.mintempC!.round().toString()}°',
                style: Styles.textStyle20,
              ),
            ],
          );
       
  }
}
