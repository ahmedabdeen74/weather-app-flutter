import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kSplashViewColor,
      title: Text(
        'Weather',
        style: Styles.textStyle20.copyWith(
          fontSize: 26,
        ),
      ),
    );
  }
}
