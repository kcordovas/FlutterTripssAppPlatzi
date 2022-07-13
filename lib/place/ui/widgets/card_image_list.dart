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
          CardImage(
              pathImage: "assets/london.jpg",
              widthImage: 300.0,
              heightImage: 250.0,
              isWithIcon: true,
              iconData: Icons.favorite_outline,
              marginHorizontal: 20.0,
              marginTop: 80.0,
              marginBottom: 20.0,
              onPressedFabIcon: () {},
              heroTag: "FAB_TWO"),
          CardImage(
              pathImage: "assets/london.jpg",
              widthImage: 300.0,
              heightImage: 250.0,
              isWithIcon: true,
              iconData: Icons.favorite_outline,
              marginHorizontal: 20.0,
              marginTop: 80.0,
              marginBottom: 20.0,
              onPressedFabIcon: () {},
              heroTag: "FAB_One"),
          CardImage(
              pathImage: "assets/london.jpg",
              widthImage: 300.0,
              heightImage: 250.0,
              isWithIcon: true,
              iconData: Icons.favorite_outline,
              marginHorizontal: 20.0,
              marginTop: 80.0,
              marginBottom: 20.0,
              onPressedFabIcon: () {},
              heroTag: "FAB_THREE"),
        ],
      ),
    );
  }
}
