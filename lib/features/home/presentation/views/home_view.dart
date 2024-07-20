import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_curved_navigation_bar.dart';
import 'package:weather_app/features/home/presentation/views/widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: HomeViewBody(),
          bottomNavigationBar: CustomCurvedNavigationBar()),
    );
  }
}
