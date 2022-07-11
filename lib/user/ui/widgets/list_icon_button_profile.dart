import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/user/ui/widgets/icon_button_profile.dart';

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
          // Add new place
          IconButtonWhite(Icons.add, true, false),
          // Change Password
          IconButtonWhite(Icons.vpn_key, false, true),
          // Close session - Logout
          IconButtonWhite(Icons.logout, false, true),
        ],
      ),
    );
  }
}
