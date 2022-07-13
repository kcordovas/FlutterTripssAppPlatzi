import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthApi = FirebaseAuthApi();

  Future<User?> signInFirebase() => _firebaseAuthApi.signIngFirebase();

  Stream<User?> get authStatus => _firebaseAuthApi.authStatus;

  User? get currentUser => _firebaseAuthApi.currentUser;

  signOut() => _firebaseAuthApi.signOut();
}
