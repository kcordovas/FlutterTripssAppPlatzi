import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {
  var pathImage = "assets/london.jpg";
  var widthImage = 250.0;
  var isWithIcon = true;

  CardImage(this.pathImage, this.widthImage, this.isWithIcon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: widthImage,
      margin: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(pathImage), fit: BoxFit.cover),
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
      children: [card, isWithIcon ? FloatingActionButtonGreen() : Container()],
    );
  }
}
