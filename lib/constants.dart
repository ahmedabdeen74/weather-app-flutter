import 'package:flutter/material.dart';
const kPrimaryColor = Color.fromARGB(255, 46, 13, 99);
const kSecondaryColor = Color(0xff312B5B);
const kBorderColor = Color.fromARGB(255, 108, 97, 181);
const kWhiteColor = Colors.white;
const kGreyColor = Colors.grey;
const kSplashViewColor = Color(0xff100b20);
OutlineInputBorder buildBorder({required Color color, required double radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
