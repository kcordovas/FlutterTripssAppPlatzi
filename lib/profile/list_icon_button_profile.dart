import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/profile/icon_button_profile.dart';

class ListIconHorizontalProfile extends StatelessWidget {
  const ListIconHorizontalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButtonWhite(Icons.flag, true, true),
          IconButtonWhite(Icons.card_giftcard, false, true),
          IconButtonWhite(Icons.add, true, false),
          IconButtonWhite(Icons.mail, false, true),
          IconButtonWhite(Icons.person, false, true),
        ],
      ),
    );
  }
}
