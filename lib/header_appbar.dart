import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/card_image_list.dart';
import 'package:platzi_tripss_app/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GradientBack("Welcome", 250.0), CardImageList()],
    );
  }
}
