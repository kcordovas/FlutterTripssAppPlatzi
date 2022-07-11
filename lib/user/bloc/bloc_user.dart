import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/user/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  // Data Flow - Streams
  // Streams with Firebase
  // StreamController
  final Stream<User?> _streamUser = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => _streamUser;

  final _currentUser = FirebaseAuth.instance.currentUser;
  User? get currentUser => _currentUser;

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

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
