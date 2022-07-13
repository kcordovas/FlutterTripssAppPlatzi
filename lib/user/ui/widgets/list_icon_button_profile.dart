import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_tripss_app/place/ui/screens/add_place_screen.dart';
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
            onPressed: () {
              File image;
              try {
                final imagePicker = ImagePicker();
                final imageCameraPicker =
                    imagePicker.pickImage(source: ImageSource.camera);

                imageCameraPicker.then((value) {
                  if (value != null) {
                    image = File(value.path);
                    Navigator.pushNamed(context, AddPlaceScreen.routeName,
                        arguments: image);
                  } else {
                    print("photo is null");
                  }
                });
              } catch (error) {
                print("Error ${error.toString()}");
              }
            },
            heroTagString: "FAB_ADD",
          ),
          // Change Password
          IconButtonWhite(
            iconButton: Icons.vpn_key,
            isMini: true,
            onPressed: () {},
            isGrayColor: true,
            heroTagString: "VPN_ADD",
          ),
          // Close session - Logout
          IconButtonWhite(
            iconButton: Icons.logout,
            isMini: true,
            isGrayColor: true,
            onPressed: () {
              _userBloc.signOut();
            },
            heroTagString: "LOGOUT",
          ),
        ],
      ),
    );
  }
}
