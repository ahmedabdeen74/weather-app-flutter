import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/styles.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.vertical,
      required this.horizontal,
      required this.radius,
      required this.onSubmitted,
      this.controller});
  final double vertical;
  final double horizontal;
  final double radius;
  final void Function(String) onSubmitted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return 
      TextField(
        controller: controller,
        style: Styles.textStyle16.copyWith(
          color: kWhiteColor,
        ),
        cursorColor: kPrimaryColor,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
            enabledBorder: buildBorder(color: kBorderColor, radius: radius),
            hoverColor: kWhiteColor,
            hintStyle: const TextStyle(
              color: kWhiteColor,
            ),
            labelStyle: const TextStyle(
              color: kWhiteColor,
            ),
            filled: true,
            fillColor: kSecondaryColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: vertical,
              horizontal: horizontal,
            ),
            hintText: 'Enter City Name',
            suffixIcon: const Icon(
              Icons.search,
              color: kWhiteColor,
            ),
            labelText: 'Search',
            focusedBorder: buildBorder(color: kWhiteColor, radius: radius)),
      );
    }
  }

