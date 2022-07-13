import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzi_tripss_app/place/repository/firebase_storage_api.dart';

class StorageRepository {
  final _firebaseStorageApi = FirebaseStorageApi();

  Future<TaskSnapshot> uploadFile(String path, File image) =>
      _firebaseStorageApi.uploadFile(path, image);
}
