import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_tripss_app/place/model/place.dart';
import 'package:platzi_tripss_app/user/model/user.dart';
import 'package:platzi_tripss_app/user/repository/cloud_firestore_api.dart';

class CloudFireStoreRepository {
  final _cloudFireStoreApi = CloudFireStoreApi();

  void updateUserFireStore(UserTrips userTrips) =>
      _cloudFireStoreApi.updateUserData(userTrips);

  Future<void> updatePlaceData(Place place) =>
      _cloudFireStoreApi.updatePlaceData(place);

  Stream<QuerySnapshot> get placesStream =>
      _cloudFireStoreApi.placeListStream();

  List<Place> buildPlacesOfSnapshot(List<DocumentSnapshot> listSnapshot) =>
      _cloudFireStoreApi.buildPlacesOfSnapshot(listSnapshot);
}
