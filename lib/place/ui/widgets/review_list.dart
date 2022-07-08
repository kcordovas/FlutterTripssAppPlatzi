import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewCard("assets/london.jpg", "Kevin One", "1 toll", "One comment"),
        ReviewCard("assets/london.jpg", "Kevin Two", "2 toll", "Two comment"),
        ReviewCard(
            "assets/london.jpg", "Kevin Three", "3 toll", "Three comment"),
      ],
    );
  }
}
