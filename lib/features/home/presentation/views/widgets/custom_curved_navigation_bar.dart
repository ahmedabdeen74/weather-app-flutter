import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/app_router.dart';
class CustomCurvedNavigationBar extends StatelessWidget {
  const CustomCurvedNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        height: 55,
        backgroundColor: kBorderColor,
        //const Color.fromARGB(255, 117, 91, 188),
        //buttonBackgroundColor: Colors.white,
        color: kSecondaryColor,
        //const Color.fromARGB(255, 61, 50, 111)
        onTap: (index) {
          switch (index) {
            case 1:
              GoRouter.of(context).push(AppRouter.kSearchView);
              break;
            case 2:
              GoRouter.of(context).push(AppRouter.kListView);
              break;
          }
        },
        items: const [
         Icon(
            FontAwesomeIcons.mapPin,
            color: kWhiteColor,
            size: 30,
          ),
          Icon(
            Icons.add,
            color: kWhiteColor,
            size: 34,
          ),
          Icon(
            Icons.list,
            color: kWhiteColor,
            size: 34,
          ),
        ]);
  }
}
