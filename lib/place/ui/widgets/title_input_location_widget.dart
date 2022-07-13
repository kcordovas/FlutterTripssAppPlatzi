import 'package:flutter/material.dart';

class TextInputLocationWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController editingController;
  final IconData iconData;

  const TextInputLocationWidget(
      {Key? key,
      required this.hintText,
      required this.iconData,
      required this.editingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black12, blurRadius: 15.0, offset: Offset(0.0, 7.0))
      ]),
      child: TextField(
        controller: editingController,
        style: const TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(iconData),
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12.0)))),
      ),
    );
  }
}
