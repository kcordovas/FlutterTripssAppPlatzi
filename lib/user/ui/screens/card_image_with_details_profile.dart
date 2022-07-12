import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image.dart';
import 'package:platzi_tripss_app/user/ui/widgets/card_details_image_profile.dart';

class CardImageWithDetails extends StatelessWidget {
  const CardImageWithDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.0, 1.1),
      children: [
        CardImage(
            "assets/london.jpg", double.infinity, false, "FAB_DETAIL_HERO"),
        CardDetailsImageProfile()
      ],
    );
  }
}
