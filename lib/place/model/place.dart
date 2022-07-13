import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/user/model/user.dart';

class Place {
  String id;
  String name;
  String description;
  String? uriImage;
  int numLikes;
  //UserTrips? userTripsOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      this.uriImage,
      //this.userTripsOwner,
      this.numLikes = 0,
      this.id = ""});
}
