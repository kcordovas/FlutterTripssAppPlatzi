import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/floating_action_button_green.dart';

class CardDetailsImageProfile extends StatelessWidget {
  var titleDetail = "Knucles Mountain";
  var description = "Hiking, Walter, Scenary";
  var steps = "Steps 123, 123, 123";
  CardDetailsImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardDetails = Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            titleDetail,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 24.0,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 10.0, fontFamily: "Lato", color: Colors.grey),
          ),
          Text(
            steps,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 12.0, fontFamily: "Lato", color: Colors.orangeAccent),
          )
        ],
      ),
    );
    return Container(
      height: 100.0,
      width: 250.0,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
      child: Stack(
        alignment: const Alignment(1.0, 1.9),
        children: [cardDetails, FloatingActionButtonGreen()],
      ),
    );
  }
}
