import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image.dart';
import 'package:platzi_tripss_app/place/ui/widgets/title_input_location_widget.dart';
import 'package:platzi_tripss_app/widgets/button_purple.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';
import 'package:platzi_tripss_app/widgets/text_input_widget.dart';
import 'package:platzi_tripss_app/widgets/title_header_widget.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add_place_screen';

  File? fileImage;
  AddPlaceScreen({Key? key, this.fileImage}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerInputTitlePlace = TextEditingController();
    final _controllerInputDescriptionPlace = TextEditingController();
    final _controllerInputLocationPlace = TextEditingController();

    final backgroundWidget = GradientBack(
      heightGradient: 300.0,
    );
    final headerAppBar = Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 25.0, left: 5.0),
          child: SizedBox(
            height: 48.0,
            width: 48.0,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 48.0,
                )),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
          child: const TitleHeaderWidget(
              title: "Add a new Place", withGradient: false),
        )
      ],
    );

    final bodyWidget = Container(
      margin: const EdgeInsets.only(top: 120.0, bottom: 20.0),
      child: ListView(
        children: [
          // Card Image with icon photo action
          Container(
            alignment: Alignment.center,
            child: CardImage(
              widthImage: double.infinity,
              heightImage: 300.0,
              // pathImage: widget.fileImage!.path,
              pathImage: "assets/london.jpg",
              marginHorizontal: 20.0,
              isWithIcon: true,
              iconData: Icons.camera_alt,
              heroTag: "FAB_PHOTO_ACTION",
              onPressedFabIcon: () {},
            ),
          ),
          // Inputs
          // TextInput Title
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: TextInputWidget(
              hintText: "Title",
              textInputType: null,
              maxLines: 1,
              editingController: _controllerInputTitlePlace,
            ),
          ),
          // Description
          TextInputWidget(
              hintText: "Description",
              textInputType: TextInputType.multiline,
              maxLines: 4,
              editingController: _controllerInputDescriptionPlace),
          // Input Location
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: TextInputLocationWidget(
                hintText: "Add Location",
                iconData: Icons.location_on_outlined,
                editingController: _controllerInputLocationPlace),
          ),
          // Button FAB
          Container(
            width: 70.0,
            margin: const EdgeInsets.all(16.0),
            child: ButtonPurple(
                buttonTitle: "Add Place",
                onPressed: () {
                  // 1. Firebase Storage
                  // url image
                  // 2. Cloud Firestore
                  // Place - title, description, urlImage, userOwner, likes
                }),
          )
        ],
      ),
    );
    return Scaffold(
      body: Stack(
        children: [backgroundWidget, headerAppBar, bodyWidget],
      ),
    );
  }
}
