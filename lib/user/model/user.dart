import 'package:platzi_tripss_app/place/model/place.dart';

class UserTrips {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  List<Place>? myPlaces;
  List<Place>? myFavoritePlaces;

  UserTrips(
      {required this.uid,
      required this.name,
      required this.email,
      required this.photoUrl,
      this.myPlaces,
      this.myFavoritePlaces});
}
