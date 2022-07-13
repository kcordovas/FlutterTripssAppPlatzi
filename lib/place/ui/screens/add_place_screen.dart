import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/place/model/place.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image.dart';
import 'package:platzi_tripss_app/place/ui/widgets/title_input_location_widget.dart';
import 'package:platzi_tripss_app/user/bloc/bloc_user.dart';
import 'package:platzi_tripss_app/widgets/button_purple.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';
import 'package:platzi_tripss_app/widgets/text_input_widget.dart';
import 'package:platzi_tripss_app/widgets/title_header_widget.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add_place_screen';
  AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  late UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    final controllerInputTitlePlace = TextEditingController();
    final controllerInputDescriptionPlace = TextEditingController();
    final controllerInputLocationPlace = TextEditingController();

    final fileArgument = ModalRoute.of(context)!.settings.arguments as File;

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
              pathImage: fileArgument.path,
              // pathImage: "assets/london.jpg",
              imageType: EImageType.Local,
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
              editingController: controllerInputTitlePlace,
            ),
          ),
          // Description
          TextInputWidget(
              hintText: "Description",
              textInputType: TextInputType.multiline,
              maxLines: 4,
              editingController: controllerInputDescriptionPlace),
          // Input Location
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: TextInputLocationWidget(
                hintText: "Add Location",
                iconData: Icons.location_on_outlined,
                editingController: controllerInputLocationPlace),
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
                  // Get User ID
                  final currentUser = _userBloc.currentUser();
                  if (currentUser != null) {
                    final String uidUser = currentUser.uid;
                    final String pathStorage =
                        "$uidUser/${DateTime.now().toString()}.jpg";
                    _userBloc.uploadFile(pathStorage, fileArgument).then(
                        (snapshot) =>
                            snapshot.ref.getDownloadURL().then((urlImage) {
                              // 2. Cloud Firestore
                              // Place - title, description, urlImage, userOwner, likes
                              _userBloc
                                  .updatePlace(Place(
                                      name: controllerInputTitlePlace.text,
                                      description:
                                          controllerInputDescriptionPlace.text,
                                      uriImage: urlImage,
                                      numLikes: 0))
                                  .whenComplete(() => Navigator.pop(context));
                            }));
                  }
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
