import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApi {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<TaskSnapshot> uploadFile(String path, File image) async =>
      await _firebaseStorage.ref().child(path).putFile(image);
}
