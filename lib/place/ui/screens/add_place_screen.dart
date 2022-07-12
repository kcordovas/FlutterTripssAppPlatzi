import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(
            heightGradient: 300.0,
          ),
          Row(
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
                padding:
                    const EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                child: const TitleHeaderWidget(
                    title: "Add a new Place", withGradient: false),
              )
            ],
          )
        ],
      ),
    );
  }
}
