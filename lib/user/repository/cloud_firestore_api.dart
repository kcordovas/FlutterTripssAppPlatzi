import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_tripss_app/user/model/user.dart';

class CloudFireStoreApi {
  // ignore: constant_identifier_names
  final userCollectionName = "users";
  // ignore: constant_identifier_names
  final placesCollectionName = "places";

  final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;

  void updateUserData(UserTrips userTrips) async {
    final CollectionReference collectionReference =
        _firebaseStorage.collection(userCollectionName);
    final docReference = collectionReference.doc(userTrips.uid);
    return docReference.set({
      UserFireStoreLabel.uid.name: userTrips.uid,
      UserFireStoreLabel.name.name: userTrips.name,
      UserFireStoreLabel.email.name: userTrips.email,
      UserFireStoreLabel.photoUrl.name: userTrips.photoUrl,
      UserFireStoreLabel.myPlaces.name: userTrips.myPlaces,
      UserFireStoreLabel.myFavoritePlaces.name: userTrips.myFavoritePlaces,
      UserFireStoreLabel.lastSignIn.name: DateTime.now()
    }, SetOptions(merge: true));
  }
}

enum UserFireStoreLabel {
  uid,
  name,
  email,
  photoUrl,
  myPlaces,
  myFavoritePlaces,
  lastSignIn,
}
