import 'package:flutter/cupertino.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/core/utils/assets.dart';
import 'package:weather_app/core/utils/styles.dart';
import 'package:weather_app/features/home/presentation/views/widgets/back_ground_image.dart';
import 'package:weather_app/features/home/presentation/views/widgets/house_back_ground_image.dart';
class NoWeatherHomeBody extends StatelessWidget {
  const NoWeatherHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Stack(
        children:[
           const BackGroundImage(),
           const Center(child: HouseBackGroundImage()),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                  'Weather ',style: Styles.textStyle20.copyWith(
                    fontSize: 26,
                  ),
                 ),
                 Image.asset(AssetsData.kSunRainy,height: MediaQuery.of(context).size.height*.15,),
               ],
             ),
           ),
         Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
              child:Column(
                children: [
                   Text(
                    "there is no weather",textAlign: TextAlign.center,style: Styles.textStyle20.copyWith(
                      fontSize: 24,                   
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                    Text(
                    "       start searching now  🔍",style: Styles.textStyle20.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            ),
          ),
          // CustomDraggableScrollableSheet()
        ],
      ),
    );
  }
  }
