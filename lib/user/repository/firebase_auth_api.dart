import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthApi {
  // Creation of instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Data Flow - Streams
  // Streams with Firebase
  // StreamController
  final Stream<User?> _streamUser = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => _streamUser;

  final _currentUser = FirebaseAuth.instance.currentUser;
  User? get currentUser => _currentUser;

  Future<User?> signIngFirebase() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      // Future<UserCredential>
      // to return UserCredential use the await word
      final userCredential = await _auth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken));
      return userCredential.user;
    } else {
      throw Exception("GoogleSignInAccount is null");
    }
  }

  void signOut() async {
    await _auth.signOut().then((value) => print("Session close"));
    _googleSignIn.signOut();
    print("Google Session closed");
  }
}
