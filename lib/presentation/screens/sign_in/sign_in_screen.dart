import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_in_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/home/home_screen.dart';
import 'package:lauquang_doan/presentation/screens/sign_in/sign_in_state.dart';
import 'package:lauquang_doan/presentation/screens/sign_in/sign_in_view_model.dart';
import 'package:lauquang_doan/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/utilities/enums/validator_type.dart';
import 'package:lauquang_doan/presentation/widgets/custom_button.dart';
import 'package:lauquang_doan/presentation/widgets/custom_loading_indicator.dart';
import 'package:lauquang_doan/presentation/widgets/custom_text_field.dart';

final signInViewModelProvider =
    StateNotifierProvider.autoDispose<SignInViewModel, SignInState>(
  (ref) => SignInViewModel(
    injector.get<SignInUseCase>(),
  ),
);

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  SignInViewModel get _viewModel => ref.read(signInViewModelProvider.notifier);

  void addFetchDataListener() {
    ref.listen(signInViewModelProvider.select((value) => value.loadingStatus),
        (previous, next) {
      if (next == LoadingStatus.success) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        });
      }
    });
  }

  void addErrorMessageListener(BuildContext context) {
    ref.listen(signInViewModelProvider.select((value) => value.errorCode),
        (previous, next) {
      if (next.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next),
            backgroundColor: Colors.red,
          ),
        );
      }
      _viewModel.resetError();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInViewModelProvider);
    addFetchDataListener();
    addErrorMessageListener(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Stack(
        children: [
          Form(
            key: _viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                        child: Text(
                          'Đăng nhập với Email',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    aboveText: 'Địa chỉ email',
                    hintText: 'Nhập địa chỉ email',
                    suffixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    controller: _viewModel.emailTextEditingController,
                    validatorType: ValidatorType.email,
                  ),
                  CustomTextField(
                    aboveText: 'Mật khẩu',
                    hintText: 'Nhập mật khẩu',
                    keyboardType: TextInputType.visiblePassword,
                    controller: _viewModel.passwordTextEditingController,
                    errorMaxLines: 2,
                    validatorType: ValidatorType.password,
                    obscureText: !state.isPasswordVisible,
                    onSuffixIconTap: () {
                      _viewModel.onPasswordVisibilityPressed();
                    },
                    suffixIcon: Icon(state.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),

                  CustomButton(
                      marginVertical: 30,
                      text: 'Đăng nhập',
                      onTap: () {
                        if (!_viewModel.formKey.currentState!.validate())
                          return;
                        _viewModel.onSignInButtonPressed();
                      }),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Bạn chưa có tài khoản?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white, // Màu nền của nút
                          side: BorderSide(color: Colors.orange, width: 2), // Viền màu cam
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Góc bo tròn
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Tạo tài khoản mới',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const SignUpScreen()));
                  //     },
                  //     child: Container(
                  //       height: 50,
                  //       width: MediaQuery.of(context).size.width * 0.9,
                  //       child: const Text('Đăng ký',
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w600,
                  //           )),
                  //     )),
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
