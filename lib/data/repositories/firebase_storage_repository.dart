import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {
  final FirebaseStorage _firebaseStorage;
  FirebaseStorageRepository(this._firebaseStorage);
  Future<String> uploadAvatar({
    required File file,
    required String uid,
  }) async {
    final ref = _firebaseStorage.ref().child('avatars/$uid');
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() => null);
    return await snapshot.ref.getDownloadURL();
  }
}
