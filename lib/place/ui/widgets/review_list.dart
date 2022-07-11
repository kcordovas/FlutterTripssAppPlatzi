import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewCard(
            pathImage: "assets/london.jpg",
            titleCardText: "Kevin One",
            detailsCardText: "1 toll",
            additionalCardText: "One comment"),
        ReviewCard(
            pathImage: "assets/london.jpg",
            titleCardText: "Kevin Two",
            detailsCardText: "2 toll",
            additionalCardText: "Two comment"),
        ReviewCard(
            pathImage: "assets/london.jpg",
            titleCardText: "Kevin Three",
            detailsCardText: "3 toll",
            additionalCardText: "Three comment"),
      ],
    );
  }
}
