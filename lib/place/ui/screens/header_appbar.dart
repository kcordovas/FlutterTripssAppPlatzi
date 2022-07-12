import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image_list.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack(
          title: "Welcome",
          heightGradient: 250.0,
        ),
        CardImageList()
      ],
    );
  }
}
