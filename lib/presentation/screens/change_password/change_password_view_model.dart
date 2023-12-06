import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/presentation/screens/change_password/change_password_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class ChangePasswordViewModel extends StateNotifier<ChangePasswordState> {
  ChangePasswordViewModel() : super(const ChangePasswordState());
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void changePassword() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<void> onTapSubmit() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    try {
      // validate form
      if (!formKey.currentState!.validate()) {
        state = state.copyWith(loadingStatus: LoadingStatus.initial);
        return;
      }
      // reauthenticate
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(EmailAuthProvider.credential(
        email: FirebaseAuth.instance.currentUser!.email!,
        password: currentPasswordController.text,
      ));
      // change password
      await FirebaseAuth.instance.currentUser!
          .updatePassword(newPasswordController.text);
      state = state.copyWith(
          loadingStatus: LoadingStatus.success,
          snackBarMessage: 'Change password successfully');
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        errorCode: e.code,
        loadingStatus: LoadingStatus.error,
      );
    } catch (e) {
      state = state.copyWith(
          loadingStatus: LoadingStatus.error, errorCode: e.toString());
    }
  }

  void updateSnackBarMessage(String message) {
    state = state.copyWith(snackBarMessage: message);
  }

  void resetSnackBarMessage() {
    state = state.copyWith(snackBarMessage: '');
  }

  void resetError() {
    state = state.copyWith(
      errorCode: '',
      loadingStatus: LoadingStatus.initial,
    );
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}
