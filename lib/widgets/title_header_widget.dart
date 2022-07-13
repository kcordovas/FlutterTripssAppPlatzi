import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';

class TitleHeaderWidget extends StatelessWidget {
  final String title;
  final bool withGradient;
  final double? heightGradient;
  const TitleHeaderWidget(
      {Key? key,
      required this.title,
      required this.withGradient,
      this.heightGradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withGradient ? titleWithGradientHeader() : titleWidget();
  }

  Widget titleWithGradientHeader() {
    return Stack(
      children: [
        GradientBack(heightGradient: heightGradient),
        Container(
          padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
          child: titleWidget(),
        )
      ],
    );
  }

  Widget titleWidget() => Text(title,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          overflow: TextOverflow.visible,
          fontWeight: FontWeight.bold));
}
