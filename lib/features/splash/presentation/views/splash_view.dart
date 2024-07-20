
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/features/splash/presentation/views/widgets/splash_view_body.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kSplashViewColor,
      body:SplashViewBody(),
    );
  }
}













/*AnimatedSplashScreen(
      splash:
          Container(
           //height: MediaQuery.of(context).size.height*.5,
            //width: double.infinity,
            child: LottieBuilder.asset(
             'assets/Lottie/Animation - 1719460806020.json',
          height: 300,
          width: 300,
            )
          ),
      
      nextScreen: const HomeView(),
      //splashIconSize: 100,
      backgroundColor: kPrimaryColor,
    );*/
