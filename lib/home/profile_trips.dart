import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/gradient_back.dart';
import 'package:platzi_tripss_app/header_appbar.dart';
import 'package:platzi_tripss_app/profile/card_image_list_with_details_profile.dart';
import 'package:platzi_tripss_app/profile/list_icon_button_profile.dart';
import 'package:platzi_tripss_app/review.dart';

class ProfileTrips extends StatelessWidget {
  const ProfileTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack("Profile", 350.0),
        CardImageListWithDetailsProfile(),
        Column(
          children: [
            Container(
              height: 100.0,
            ),
            ReviewCard("assets/london.jpg", "Pathum Tzoo",
                "pathumtz001@gmail.com", ""),
            ListIconHorizontalProfile(),
          ],
        ),
      ],
    );
  }
}
