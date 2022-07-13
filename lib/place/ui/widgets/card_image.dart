import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {
  final String pathImage;
  final double heightImage;
  final double widthImage;
  final bool isWithIcon;
  IconData? iconData;
  String? heroTag;
  VoidCallback? onPressedFabIcon;
  double marginHorizontal;
  double marginTop;
  double marginBottom;
  EImageType imageType;

  CardImage(
      {Key? key,
      required this.heightImage,
      required this.widthImage,
      required this.pathImage,
      required this.isWithIcon,
      this.iconData,
      this.onPressedFabIcon,
      this.heroTag,
      this.marginHorizontal = 20.0,
      this.marginTop = 0.0,
      this.marginBottom = 0.0,
      this.imageType = EImageType.Asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider imageWidget;
    switch (imageType) {
      case EImageType.Local:
        imageWidget = FileImage(File(pathImage));
        break;
      case EImageType.Neetwork:
        imageWidget = NetworkImage(pathImage);
        break;
      default:
        imageWidget = AssetImage(pathImage);
    }
    final card = Container(
      height: heightImage,
      width: widthImage,
      margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          left: marginHorizontal,
          right: marginHorizontal),
      decoration: BoxDecoration(
          image: DecorationImage(image: imageWidget, fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );
    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: [
        card,
        isWithIcon
            ? FloatingActionButtonGreen(
                iconData: iconData!,
                onPressed: onPressedFabIcon!,
                heroTagString: heroTag!,
              )
            : Container()
      ],
    );
  }
}

enum EImageType { Neetwork, Local, Asset }
