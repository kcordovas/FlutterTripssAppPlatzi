import 'package:flutter/material.dart';

class IconButtonWhite extends StatefulWidget {
  final VoidCallback onPressed;
  final iconButton;
  final isMini;
  final isGrayColor;
  IconButtonWhite(
      {Key? key,
      required this.iconButton,
      required this.onPressed,
      this.isMini = true,
      this.isGrayColor = false})
      : super(key: key);

  @override
  State<IconButtonWhite> createState() => _IconButtonWhiteState();
}

class _IconButtonWhiteState extends State<IconButtonWhite> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      mini: widget.isMini,
      backgroundColor: widget.isGrayColor ? Colors.grey : Colors.white,
      child: Icon(
        widget.iconButton,
        color: Colors.indigo,
      ),
    );
  }
}
