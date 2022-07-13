import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/model/place.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image.dart';
import 'package:platzi_tripss_app/user/ui/widgets/card_details_image_profile.dart';

class CardImageWithDetails extends StatelessWidget {
  final Place place;
  const CardImageWithDetails({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.0, 1.1),
      children: [
        CardImage(
          pathImage: place.uriImage!,
          heightImage: 250.0,
          widthImage: double.infinity,
          imageType: EImageType.Neetwork,
          marginTop: 30.0,
          isWithIcon: false,
        ),
        CardDetailsImageProfile(
          titleDetail: place.name,
          description: place.description,
          steps: place.numLikes.toString(),
          heroTagString: place.id,
        )
      ],
    );
  }
}
