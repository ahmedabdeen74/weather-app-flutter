import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/features/home/presentation/views/widgets/back_ground_image.dart';
import 'package:weather_app/features/home/presentation/views/widgets/house_back_ground_image.dart';
class CustomLoadingHomeView extends StatelessWidget {
  const CustomLoadingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Stack(
        children:[
           const BackGroundImage(),
           const Center(child: HouseBackGroundImage()),
         Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
              child: const Center(
                child: CircularProgressIndicator())
            ),
          ),
          // CustomDraggableScrollableSheet()
        ],
      ),
    );
  }
}