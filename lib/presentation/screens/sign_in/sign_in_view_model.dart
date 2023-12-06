import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_in_use_case.dart';
import 'package:lauquang_doan/presentation/screens/sign_in/sign_in_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class SignInViewModel extends StateNotifier<SignInState> {
  SignInViewModel(
    this._signInUseCase,
  ) : super(const SignInState());
  final SignInUseCase _signInUseCase;
  final formKey = GlobalKey<FormState>();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  void onPasswordVisibilityPressed() {
    state = state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    );
  }

  Future<void> onSignInButtonPressed() async {
    state = state.copyWith(
      loadingStatus: LoadingStatus.loading,
    );
    try {
      SignInWithEmailParams params = SignInWithEmailParams(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      );
      await _signInUseCase.run(params);
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        errorCode: e.code,
      );
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        errorCode: e.toString(),
      );
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
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }
}
