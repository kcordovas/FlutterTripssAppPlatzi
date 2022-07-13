import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/user/model/user.dart';
import 'package:platzi_tripss_app/user/repository/auth_repository.dart';
import 'package:platzi_tripss_app/user/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  final _cloudFireStoreRepository = CloudFireStoreRepository();

  // Data Flow - Streams
  // Streams with Firebase
  // StreamController
  authStatus() => _authRepository.authStatus;

  currentUser() => _authRepository.currentUser;

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

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
