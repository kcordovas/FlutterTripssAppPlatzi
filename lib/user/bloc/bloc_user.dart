import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/place/model/place.dart';
import 'package:platzi_tripss_app/place/repository/storage_repository.dart';
import 'package:platzi_tripss_app/user/model/user.dart';
import 'package:platzi_tripss_app/user/repository/auth_repository.dart';
import 'package:platzi_tripss_app/user/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  final _cloudFireStoreRepository = CloudFireStoreRepository();
  final _storageRepository = StorageRepository();

  // Data Flow - Streams
  // Streams with Firebase
  // StreamController
  authStatus() => _authRepository.authStatus;

  currentUser() => _authRepository.currentUser;

  Stream<QuerySnapshot> placeList() => _cloudFireStoreRepository.placesStream;
  Stream<QuerySnapshot> placeListByUserId(String uidUser) =>
      _cloudFireStoreRepository.placesStreamById(uidUser);
  // Convert a snapshot in list of Places
  List<Place> buildPlacesOfSnapshot(
          List<DocumentSnapshot> listDocumentSnapshot) =>
      _cloudFireStoreRepository.buildPlacesOfSnapshot(listDocumentSnapshot);

  // Use Case of User object in method form

  // Use Case
  // 1. SignIn App with Google
  Future<User?> signIn() {
    return _authRepository.signInFirebase();
  }

  // Use Case
  // 2. SignOut
  void signOut() {
    _authRepository.signOut();
  }

  // Use Case
  // 3. Register a user
  void updateUser(UserTrips userTrips) =>
      _cloudFireStoreRepository.updateUserFireStore(userTrips);

  // Use Case
  // 4. Add a place
  Future<void> updatePlace(Place place) =>
      _cloudFireStoreRepository.updatePlaceData(place);

  // Use Case
  // 5. Upload a image to Storage
  uploadFile(String path, File image) =>
      _storageRepository.uploadFile(path, image);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
