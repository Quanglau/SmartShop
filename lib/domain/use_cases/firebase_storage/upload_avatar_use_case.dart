import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lauquang_doan/data/repositories/firebase_storage_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class UploadAvatarUseCase implements FutureUseCase<File, String> {
  @override
  Future<String> run(File input) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return injector
        .get<FirebaseStorageRepository>()
        .uploadAvatar(file: input, uid: uid);
  }
}
