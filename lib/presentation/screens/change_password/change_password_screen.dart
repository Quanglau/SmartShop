import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/presentation/screens/change_password/change_password_state.dart';
import 'package:lauquang_doan/presentation/screens/change_password/change_password_view_model.dart';
import 'package:lauquang_doan/presentation/utilities/enums/validator_type.dart';
import 'package:lauquang_doan/presentation/widgets/custom_button.dart';
import 'package:lauquang_doan/presentation/widgets/custom_text_field.dart';

final changePasswordViewModelProvider = StateNotifierProvider.autoDispose<
    ChangePasswordViewModel, ChangePasswordState>(
  (ref) => ChangePasswordViewModel(),
);

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  static const routeName = '/change-password';

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  ChangePasswordViewModel get _viewModel =>
      ref.read(changePasswordViewModelProvider.notifier);

  void onErrorListener() {
    ref.listen(
        changePasswordViewModelProvider.select((value) => value.errorCode),
        (previous, next) {
      if (next != '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next,
            ),
          ),
        );
        _viewModel.resetError();
      }
    });
  }

  void onSnackBarMessageListener() {
    ref.listen(
        changePasswordViewModelProvider
            .select((value) => value.snackBarMessage), (previous, next) {
      if (next != '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next,
            ),
          ),
        );
        _viewModel.resetSnackBarMessage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onErrorListener();
    onSnackBarMessageListener();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Đổi mật khẩu'),
        centerTitle: true,
      ),
      body: Form(
        key: _viewModel.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // current password
              CustomTextField(
                controller: _viewModel.currentPasswordController,
                aboveText: 'Mật khẩu hiện tại',
                hintText: 'Nhập mật khẩu hiện tại',
                obscureText: !ref.watch(changePasswordViewModelProvider
                    .select((value) => value.isPasswordVisible)),
                suffixIcon: ref.watch(changePasswordViewModelProvider
                        .select((value) => value.isPasswordVisible))
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onSuffixIconTap: _viewModel.changePassword,
                validatorType: ValidatorType.password,
              ),
              // new password
              CustomTextField(
                controller: _viewModel.newPasswordController,
                aboveText: 'Mật khẩu mới',
                hintText: 'Nhập mật khẩu mới',
                obscureText: !ref.watch(changePasswordViewModelProvider
                    .select((value) => value.isPasswordVisible)),
                suffixIcon: ref.watch(changePasswordViewModelProvider
                        .select((value) => value.isPasswordVisible))
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onSuffixIconTap: _viewModel.changePassword,
                validatorType: ValidatorType.password,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: 'Cập nhật',
                onTap: _viewModel.onTapSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
