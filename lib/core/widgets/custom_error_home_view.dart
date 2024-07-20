import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/presentation/views/widgets/back_ground_image.dart';
import 'package:weather_app/features/home/presentation/views/widgets/house_back_ground_image.dart';

import '../../constants.dart';

class CustomErrorHomeView extends StatelessWidget {
  const CustomErrorHomeView({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Stack(
        children: [
          const BackGroundImage(),
          const Center(child: HouseBackGroundImage()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weather ',
                  style: Styles.textStyle20.copyWith(
                    fontSize: 26,
                  ),
                ),
                Image.asset(
                  AssetsData.kSunRainy,
                  height: MediaQuery.of(context).size.height * .15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.5,
            child: Center(
              child: Text(
                        errMessage,style: Styles.textStyle16.copyWith(
                          color: Colors.blue,
                        ),),
            ),
          ),
          // CustomDraggableScrollableSheet()
        ],
      ),
    );
  }
}
