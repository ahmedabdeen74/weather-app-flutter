import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/assets.dart';

class HouseBackGroundImage extends StatelessWidget {
  const HouseBackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.37),
      child: Image.asset(
        AssetsData.kHouse,
        // opacity: 0,
      ),
    );
  }
}
