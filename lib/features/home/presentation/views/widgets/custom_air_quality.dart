import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/core/utils/styles.dart';

class CustomAirQuality extends StatelessWidget {
  const CustomAirQuality({super.key, required this.airQualityValue});
  final String airQualityValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .19,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AssetsData.kAirQuality,
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .03,
                ),
                Text(
                  'AIR QUALITY',
                  style: Styles.textStyle16.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Text(
              '$airQualityValue-Low Health Risk',
              style: Styles.textStyle20.copyWith(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
