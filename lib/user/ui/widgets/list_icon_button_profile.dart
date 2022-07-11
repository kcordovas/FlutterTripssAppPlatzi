import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/user/bloc/bloc_user.dart';
import 'package:platzi_tripss_app/user/ui/widgets/icon_button_profile.dart';

class ListIconHorizontalProfile extends StatelessWidget {
  late UserBloc _userBloc;
  ListIconHorizontalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // IconButtonWhite(Icons.flag, true, true),
          // IconButtonWhite(Icons.card_giftcard, false, true),
          // Add new place
          IconButtonWhite(
            iconButton: Icons.add,
            isMini: false,
            onPressed: () {},
          ),
          // Change Password
          IconButtonWhite(
            iconButton: Icons.vpn_key,
            isMini: true,
            onPressed: () {},
            isGrayColor: true,
          ),
          // Close session - Logout
          IconButtonWhite(
            iconButton: Icons.logout,
            isMini: true,
            isGrayColor: true,
            onPressed: () {
              _userBloc.signOut();
            },
          ),
        ],
      ),
    );
  }
}
