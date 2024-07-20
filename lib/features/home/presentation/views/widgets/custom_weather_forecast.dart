import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/styles.dart';

class CustomWeatherForecast extends StatelessWidget {
  const CustomWeatherForecast({super.key, required this.onTap1, required this.onTap2, required this.isHourlyForecast});
  final bool isHourlyForecast;
  final void Function() onTap1;
  final void Function() onTap2;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap1,
          child: Column(
            children: [
              Text(
                'Hourly Forecast',
                style: isHourlyForecast
                    ? GoogleFonts.roboto(
                        textStyle:
                            Styles.textStyle16.copyWith(color: kWhiteColor),
                      )
                    : GoogleFonts.roboto(textStyle: Styles.textStyle16),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .3,
                height: isHourlyForecast ? 2 : 0.3,
                color: isHourlyForecast ? Colors.blue : kGreyColor
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        GestureDetector(
          onTap: onTap2,
          child: Column(
            children: [
              Text(
                'Weekly Forecast',
                style: isHourlyForecast
                    ? GoogleFonts.roboto(textStyle: Styles.textStyle16)
                    : GoogleFonts.roboto(
                        textStyle:
                            Styles.textStyle16.copyWith(color: kWhiteColor)),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .3,
                height: isHourlyForecast ? 0.3 : 2,
                color: isHourlyForecast ? kGreyColor : Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
