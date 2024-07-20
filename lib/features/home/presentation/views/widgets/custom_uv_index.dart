import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/styles.dart';

class CustomUvIndex extends StatelessWidget {
  const CustomUvIndex({super.key, required this.uvIndexValue, required this.uvIndexCondition});
  final String uvIndexValue;
  final String uvIndexCondition;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .17,
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.sunny,
                  color: kGreyColor,
                  size: MediaQuery.of(context).size.height * .03,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Text(
                  'UV INDEX',
                  style: Styles.textStyle16.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Text(
              uvIndexValue,
              style: Styles.textStyle20.copyWith(
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Text(
              uvIndexCondition,
              style: Styles.textStyle20.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
