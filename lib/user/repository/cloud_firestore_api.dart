import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_tripss_app/place/model/place.dart';
import 'package:platzi_tripss_app/user/model/user.dart';

import 'firebase_auth_api.dart';

class CloudFireStoreApi {
  // ignore: constant_identifier_names
  final userCollectionName = "users";
  // ignore: constant_identifier_names
  final placesCollectionName = "places";

  final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;
  final _firebaseAuthApi = FirebaseAuthApi();

  Stream<QuerySnapshot> placeListStream() =>
      _firebaseStorage.collection(placesCollectionName).snapshots();

  void updateUserData(UserTrips userTrips) async {
    final CollectionReference collectionReference =
        _firebaseStorage.collection(userCollectionName);
    final docReference = collectionReference.doc(userTrips.uid);
    return await docReference.set({
      _UserFireStoreLabel.uid.name: userTrips.uid,
      _UserFireStoreLabel.name.name: userTrips.name,
      _UserFireStoreLabel.email.name: userTrips.email,
      _UserFireStoreLabel.photoUrl.name: userTrips.photoUrl,
      _UserFireStoreLabel.myPlaces.name: userTrips.myPlaces,
      _UserFireStoreLabel.myFavoritePlaces.name: userTrips.myFavoritePlaces,
      _UserFireStoreLabel.lastSignIn.name: DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    final collectionPlace = _firebaseStorage.collection(placesCollectionName);

    if (_firebaseAuthApi.currentUser != null) {
      await collectionPlace.add({
        _PlaceFireStoreLabel.name.name: place.name,
        _PlaceFireStoreLabel.description.name: place.description,
        _PlaceFireStoreLabel.likes.name: place.numLikes,
        _PlaceFireStoreLabel.uriImage.name: place.uriImage,
        // reference
        _PlaceFireStoreLabel.userOwner.name: _firebaseStorage
            .doc("$userCollectionName/${_firebaseAuthApi.currentUser?.uid}")
      }).then((documentRef) {
        documentRef.get().then((docSnapshot) {
          final docRefUser = _firebaseStorage
              .collection(userCollectionName)
              .doc(_firebaseAuthApi.currentUser?.uid);
          docRefUser.update({
            // ID place reference and as array
            _UserFireStoreLabel.myPlaces.name: FieldValue.arrayUnion([
              _firebaseStorage.doc("$placesCollectionName/${docSnapshot.id}")
            ])
          });
        });
      });
    }
  }

  List<Place> buildPlacesOfSnapshot(List<DocumentSnapshot> placeListSnapshot) {
    List<Place> listPlaces = placeListSnapshot
        .map((documentSnapshot) => Place(
            id: documentSnapshot.id,
            name: documentSnapshot[_PlaceFireStoreLabel.name.name],
            description:
                documentSnapshot[_PlaceFireStoreLabel.description.name],
            numLikes: documentSnapshot[_PlaceFireStoreLabel.likes.name],
            uriImage: documentSnapshot[_PlaceFireStoreLabel.uriImage.name]))
        .toList();
    return listPlaces;
  }
}

enum _UserFireStoreLabel {
  uid,
  name,
  email,
  photoUrl,
  myPlaces,
  myFavoritePlaces,
  lastSignIn,
}

enum _PlaceFireStoreLabel { id, name, description, uriImage, likes, userOwner }
