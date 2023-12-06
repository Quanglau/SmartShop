import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_up_use_case.dart';
import 'package:lauquang_doan/presentation/screens/sign_up/sign_up_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel(
    this._signUpUseCase,
  ) : super(const SignUpState());
  final SignUpUseCase _signUpUseCase;
  final formKey = GlobalKey<FormState>();
  final userNameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();
  void onPasswordVisibilityPressed() {
    state = state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    );
  }

  Future<void> onSignUpButtonPressed() async {
    state = state.copyWith(
      loadingStatus: LoadingStatus.loading,
    );
    try {
      SignUpParams params = SignUpParams(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      await _signUpUseCase.run(params);
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        errorCode: e.code,
      );
    } on FirebaseException catch (e) {
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        errorCode: e.code,
      );
    } catch (e) {
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        errorCode: e.toString(),
      );
      debugPrint(e.toString());
    }
  }

  void resetError() {
    state = state.copyWith(
      loadingStatus: LoadingStatus.initial,
      errorCode: '',
    );
  }

  @override
  void dispose() {
    userNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.dispose();
  }
}
