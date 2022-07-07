import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage("assets/london.jpg", 250.0, true),
          CardImage("assets/london.jpg", 250.0, true),
          CardImage("assets/london.jpg", 250.0, true),
        ],
      ),
    );
  }
}
