import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/function/hide_Keyboard_From_Screen.dart';
import 'package:weather_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboardFromScreen(context);
      },
      child: const Scaffold(
          backgroundColor: kSplashViewColor, body: SearchViewBody()),
    );
  }
}
