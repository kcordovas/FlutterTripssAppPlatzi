import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image_list.dart';
import 'package:platzi_tripss_app/widgets/title_header_widget.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TitleHeaderWidget(
          title: "Welcome",
          withGradient: true,
          heightGradient: 250.0,
        ),
        CardImageList()
      ],
    );
  }
}
