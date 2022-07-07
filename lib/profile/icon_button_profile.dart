import 'package:flutter/material.dart';

class IconButtonWhite extends StatelessWidget {
  var iconButton = Icons.add;
  var isActive = true;
  var isMini = true;
  IconButtonWhite(this.iconButton, this.isActive, this.isMini, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Profile action")));
      },
      mini: isMini,
      backgroundColor: isActive ? Colors.white : Colors.grey,
      child: Icon(
        iconButton,
        color: Colors.indigo,
      ),
    );
  }
}
