import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';
import 'package:platzi_tripss_app/user/ui/screens/card_image_list_with_details_profile.dart';
import 'package:platzi_tripss_app/place/ui/widgets/review.dart';
import 'package:platzi_tripss_app/user/ui/widgets/list_icon_button_profile.dart';

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
