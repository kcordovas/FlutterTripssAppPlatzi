import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  FloatingActionButtonGreen({Key? key}) : super(key: key);

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
      onPressed: onPressedFab,
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fab",
      child: Icon(iconFavorite),
    );
  }

  onPressedFab() {
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
  }
}
