import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_up_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/home/home_screen.dart';
import 'package:lauquang_doan/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:lauquang_doan/presentation/screens/sign_up/sign_up_state.dart';
import 'package:lauquang_doan/presentation/screens/sign_up/sign_up_view_model.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/utilities/enums/validator_type.dart';
import 'package:lauquang_doan/presentation/widgets/custom_button.dart';
import 'package:lauquang_doan/presentation/widgets/custom_loading_indicator.dart';
import 'package:lauquang_doan/presentation/widgets/custom_text_field.dart';

final signUpViewModelProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignUpState>(
  (ref) => SignUpViewModel(
    injector.get<SignUpUseCase>(),
  ),
);

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  SignUpViewModel get _viewModel => ref.read(signUpViewModelProvider.notifier);
  void addFetchingListener(BuildContext context) {
    ref.listen(signUpViewModelProvider.select((value) => value.loadingStatus),
        (previous, next) {
      if (next == LoadingStatus.success) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            surfaceTintColor: Colors.white,
            title: const Text('Thành công'),
            content: const Text('Tài khoản của bạn đã được tạo thành công'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  void addErrorMessageListener(BuildContext context) {
    ref.listen(signUpViewModelProvider.select((value) => value.errorCode),
        (previous, next) {
      if (next.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next),
            backgroundColor: Colors.red,
          ),
        );
      }
      ref.read(signUpViewModelProvider.notifier).resetError();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpViewModelProvider);
    addFetchingListener(context);
    addErrorMessageListener(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        child: Text(
                          textAlign: TextAlign.left,
                          'Đăng ký',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    hintText: 'Nhập tên của bạn',
                    suffixIcon: const Icon(Icons.person),
                    keyboardType: TextInputType.name,
                    controller: _viewModel.userNameTextEditingController,
                    validatorType: ValidatorType.userName,
                  ),
                  CustomTextField(
                    hintText: 'Nhập địa chỉ email',
                    suffixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    controller: _viewModel.emailTextEditingController,
                    validatorType: ValidatorType.email,
                  ),
                  CustomTextField(
                    hintText: 'Nhập mật khẩu',
                    suffixIcon: Icon(state.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onSuffixIconTap: () {
                      ref
                          .read(signUpViewModelProvider.notifier)
                          .onPasswordVisibilityPressed();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    controller: _viewModel.passwordTextEditingController,
                    obscureText:
                        !ref.watch(signUpViewModelProvider).isPasswordVisible,
                    validatorType: ValidatorType.password,
                    errorMaxLines: 2,
                  ),
                  CustomButton(
                    marginVertical: 16,
                    onTap: () {
                      if (!_viewModel.formKey.currentState!.validate()) return;
                      ref
                          .read(signUpViewModelProvider.notifier)
                          .onSignUpButtonPressed();
                    },
                    text: 'Đăng ký',
                  ),
                  const Center(
                    child: Text(
                      'Bạn đã có tài khoản?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        },
                        child: const Text('Đăng nhập',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ))),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
              visible: state.loadingStatus == LoadingStatus.loading,
              child: const CustomLoadingIndicator()),
        ],
      ),
    );
  }
}
