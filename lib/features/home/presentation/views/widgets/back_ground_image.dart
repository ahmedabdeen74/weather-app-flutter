import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/assets.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.kWeatherBackground,
      fit: BoxFit.fill,
    );
  }
}
