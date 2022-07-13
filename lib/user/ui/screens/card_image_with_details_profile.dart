import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image.dart';
import 'package:platzi_tripss_app/user/ui/widgets/card_details_image_profile.dart';

class CardImageWithDetails extends StatelessWidget {
  final String heroTag;
  const CardImageWithDetails({Key? key, required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.0, 1.1),
      children: [
        CardImage(
          pathImage: "assets/london.jpg",
          heightImage: 250.0,
          widthImage: double.infinity,
          marginTop: 30.0,
          isWithIcon: false,
        ),
        CardDetailsImageProfile(heroTagString: heroTag)
      ],
    );
  }
}
