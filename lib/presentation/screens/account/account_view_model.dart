import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/firebase_storage/upload_avatar_use_case.dart';
import 'package:lauquang_doan/presentation/screens/account/account_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class AccountViewModel extends StateNotifier<AccountState> {
  AccountViewModel(
    this._uploadAvatarUseCase,
  ) : super(const AccountState());
  final UploadAvatarUseCase _uploadAvatarUseCase;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void onSubmitted() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
      try {
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(userNameController.text.trim());
        FirebaseAuth.instance.currentUser!
            .updateEmail(emailController.text.trim());
        if (state.avatar != null) {
          _uploadAvatarUseCase.run(state.avatar!).then((value) {
            FirebaseAuth.instance.currentUser!.updatePhotoURL(value);
          });
        }
        state = state.copyWith(loadingStatus: LoadingStatus.success);
      } on FirebaseAuthException catch (e) {
        state = state.copyWith(
            loadingStatus: LoadingStatus.error, error: e.message!);
      }
    }
    @override
    void dispose() {
      userNameController.dispose();
      emailController.dispose();
      super.dispose();
    }
  }

  void updateAvatar(File pickedFile) {
    state = state.copyWith(avatar: pickedFile);
  }
}
