import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/user/ui/screens/card_image_with_details_profile.dart';

class CardImageListWithDetailsProfile extends StatelessWidget {
  const CardImageListWithDetailsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 300.0),
      child: ListView(
        children: [
          CardImageWithDetails(),
          CardImageWithDetails(),
          CardImageWithDetails(),
          Container(height: 48.0)
        ],
      ),
    );
  }
}
