import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage("assets/london.jpg", 250.0, true, "FAB_One"),
          CardImage("assets/london.jpg", 250.0, true, "FAB_TWO"),
          CardImage("assets/london.jpg", 250.0, true, "FAB_THREE"),
        ],
      ),
    );
  }
}
