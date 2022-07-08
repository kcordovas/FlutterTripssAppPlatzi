import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  late String namePlaceText, descriptionPlace;
  late int starts;

  DescriptionPlace(this.namePlaceText, this.descriptionPlace, this.starts,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startBorder = Container(
      margin: const EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star_border,
        color: Color(0xFFf2C611),
      ),
    );

    final startHalf = Container(
      margin: const EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),
      ),
    );
    final start = Container(
      margin: const EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final titleStart = Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: 320.0, // Height between toolbar and title
              left: 20.0,
              right: 20.0),
          child: Text(
            namePlaceText,
            style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato"),
            textAlign: TextAlign.justify,
          ),
        ),
        // Starts
        Row(
          children: [start, start, start, start, startHalf],
        ),
      ],
    );
    final textDescription = Container(
      margin: const EdgeInsets.only(top: 24.0, left: 20.0, right: 20.0),
      child: Text(
        descriptionPlace,
        style: const TextStyle(fontSize: 16.0, fontFamily: "Lato"),
        textAlign: TextAlign.justify,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [titleStart, textDescription, ButtonPurple("Navigate")],
    );
  }
}
