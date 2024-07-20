import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_draggable_scrollable_sheet_list_view.dart';

class CustomDraggableScrollableSheet extends StatelessWidget {
  const CustomDraggableScrollableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize:.3,
      initialChildSize:.3,
      maxChildSize:.68,
      builder: (context, controller) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(42), topRight: Radius.circular(42)),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                const Color(0xff612FAB).withAlpha(100),
                const Color(0xFF262C51),
                //Color(0xFF3E3F74)
                // Color(0xff612FAB).withAlpha(100),
              ],
              //stops: const[1, 1],
            ),
          ),
          child:CustomDraggableScrollableSheetListView(
            controller: controller,
          )
          ),
    );
  }
}
