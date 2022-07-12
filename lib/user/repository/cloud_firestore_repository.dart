import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_tripss_app/user/model/user.dart';
import 'package:platzi_tripss_app/user/repository/cloud_firestore_api.dart';

class CloudFireStoreRepository {
  final _cloudFireStoreApi = CloudFireStoreApi();

  void updateUserFireStore(UserTrips userTrips) =>
      _cloudFireStoreApi.updateUserData(userTrips);
}
