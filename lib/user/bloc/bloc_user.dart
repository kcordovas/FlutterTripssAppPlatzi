import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/user/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  // Use Case of User object in method form

  // Use Case
  // 1. SignIn App with Google
  Future<User?> signIn() {
    return _authRepository.signInFirebase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
