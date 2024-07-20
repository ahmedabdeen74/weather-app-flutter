import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/core/utils/styles.dart';

class CustomPressureWindItem extends StatelessWidget {
  const CustomPressureWindItem({super.key,required this.itemName, required this.itemNumber, required this.itemUnit});
  final String itemName;
  final String itemNumber;
  final String itemUnit;
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AssetsData.kPressure,
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                ),
                 SizedBox(
                  width: MediaQuery.of(context).size.width*.02,
                ),
                Text(
                  itemName,
                  style: Styles.textStyle16.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height*.01,
            ),
            Center(
              child: Text(
                itemNumber,
                style: Styles.textStyle20.copyWith(
                  fontSize: 26,
                ),
              ),
            ),
             const SizedBox(
              height: 5,
            ),
             Center(
              child: Text(
                itemUnit,
                style: Styles.textStyle16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
