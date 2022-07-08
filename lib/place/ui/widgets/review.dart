import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  var pathImage = "assets/london.png";
  var nameUserText = "Kevin";
  var details = "1 review 5 photos";
  var comment = "This is amazing place";

  ReviewCard(this.pathImage, this.nameUserText, this.details, this.comment,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photo = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(pathImage), fit: BoxFit.cover),
      ),
    );

    final nameUser = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        nameUserText,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 17.0,
          fontFamily: "Lato",
        ),
      ),
    );

    final userInfo = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 13.0, fontFamily: "Lato", color: Color(0xFFa3a5a7)),
      ),
    );

    final userComment = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 13.0, fontFamily: "Lato", fontWeight: FontWeight.w900),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [nameUser, userInfo, userComment],
    );

    return Row(
      children: [photo, userDetails],
    );
  }
}
