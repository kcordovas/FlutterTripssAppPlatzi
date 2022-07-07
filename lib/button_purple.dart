import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  var buttonTitle = "Navigate";

  ButtonPurple(this.buttonTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Navigate")));
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
                colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: "Lato",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
