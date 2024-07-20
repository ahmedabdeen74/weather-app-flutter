import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, __) {
          return SlideTransition(
            position: slidingAnimation,
            child:Text(
              'Your weather updates instantly',style: Styles.textStyle16.copyWith(
                color: kWhiteColor,
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
