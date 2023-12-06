import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lauquang_doan/domain/use_cases/firebase_storage/upload_avatar_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/account/account_state.dart';
import 'package:lauquang_doan/presentation/screens/account/account_view_model.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/utilities/enums/validator_type.dart';
import 'package:lauquang_doan/presentation/widgets/custom_button.dart';
import 'package:lauquang_doan/presentation/widgets/custom_text_field.dart';

final accountViewModelProvider =
    StateNotifierProvider.autoDispose<AccountViewModel, AccountState>(
  (ref) => AccountViewModel(
    injector.get<UploadAvatarUseCase>(),
  ),
);

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  User? get user => FirebaseAuth.instance.currentUser;
  AccountViewModel get _viewModel =>
      ref.read(accountViewModelProvider.notifier);
  @override
  void initState() {
    super.initState();
    _viewModel.userNameController.text = user!.displayName ?? '';
    _viewModel.emailController.text = user!.email ?? '';
  }

  void listenChangeInformation() {
    ref.listen(accountViewModelProvider.select((value) => value.loadingStatus),
        (previous, next) {
      if (next == LoadingStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cập nhật thành công'),
          ),
        );
      } else if (next == LoadingStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ref.watch(accountViewModelProvider).error,
            ),
          ),
        );
      }
    });
  }

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    _viewModel.updateAvatar(File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(accountViewModelProvider);

    listenChangeInformation();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Quản lý tài khoản'),
        centerTitle: true,
      ),
      body: Form(
        key: _viewModel.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // avatar
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(children: [
                          ListTile(
                            onTap: () {
                              getImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Chụp ảnh'),
                          ),
                          ListTile(
                            onTap: () {
                              getImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            leading: const Icon(Icons.photo),
                            title: const Text('Chọn ảnh'),
                          ),
                        ]);
                      },
                    );
                  },
                  child: state.avatar != null
                      ? CircleAvatar(
                          radius: 28,
                          backgroundImage: FileImage(state.avatar!),
                        )
                      : CircleAvatar(
                          radius: 28,
                          backgroundImage: user!.photoURL != null
                              ? NetworkImage(user!.photoURL!)
                              : const AssetImage('assets/images/add_avatar.png')
                                  as ImageProvider,
                        ),
                ),
              ),
              CustomTextField(
                aboveText: 'Tên người dùng',
                hintText: 'Đặt tên người dùng',
                suffixIcon: const Icon(Icons.person),
                controller: _viewModel.userNameController,
                validatorType: ValidatorType.userName,
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              CustomTextField(
                aboveText: 'Địa chỉ email',
                hintText: 'Nhập địa chỉ email',
                suffixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                controller: _viewModel.emailController,
                validatorType: ValidatorType.email,
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),

              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: 'Cập nhật',
                onTap: () async {
                  _viewModel.onSubmitted();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
