import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final String heroTagString;
  final IconData iconData;
  final VoidCallback onPressed;

  const FloatingActionButtonGreen(
      {Key? key,
      required this.heroTagString,
      required this.iconData,
      required this.onPressed})
      : super(key: key);

  @override
  State<FloatingActionButtonGreen> createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  var iconFavorite = Icons.favorite_border;
  var isActive = true;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fab",
      heroTag: widget.heroTagString,
      child: Icon(widget.iconData),
    );
  }

  /*onPressedFab() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Added to Favorite")));
    setState(() {
      if (isActive) {
        iconFavorite = Icons.favorite;
        isActive = false;
      } else {
        iconFavorite = Icons.favorite_border;
        isActive = true;
      }
    });
  }*/
}
