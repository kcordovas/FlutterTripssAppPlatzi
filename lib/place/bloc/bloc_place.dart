import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../user/repository/cloud_firestore_repository.dart';
import '../model/place.dart';

class PlaceBloc implements Bloc {
  final _cloudFireStoreRepository = CloudFireStoreRepository();

  Stream<QuerySnapshot> placeList() => _cloudFireStoreRepository.placesStream;

  // Convert a snapshot in list of Places
  List<Place> buildPlacesOfSnapshot(
          List<DocumentSnapshot> listDocumentSnapshot) =>
      _cloudFireStoreRepository.buildPlacesOfSnapshot(listDocumentSnapshot);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
