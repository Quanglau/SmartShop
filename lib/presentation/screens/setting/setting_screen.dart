import 'package:flutter/material.dart';
import 'package:lauquang_doan/domain/use_cases/authentication/sign_out_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/account/acccount_screen.dart';
import 'package:lauquang_doan/presentation/screens/change_password/change_password_screen.dart';
import 'package:lauquang_doan/presentation/screens/favorite/favorite_screen.dart';
import 'package:lauquang_doan/presentation/screens/onboarding/onboarding_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cài đặt'),
      ),
      body: Column(
        children: [
          // Account Management
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountScreen()),
              );
            },
            leading: const Icon(Icons.account_circle),
            title: const Text('Quản lý tài khoản'),
          ),
          // Change Password
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen()),
              );
            },
            leading: const Icon(Icons.lock),
            title: const Text('Đổi mật khẩu'),
          ),
          // Favorite Product List
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteScreen()),
              );
            },
            leading: const Icon(Icons.favorite),
            title: const Text('Sản phẩm yêu thích'),
          ),
          //Notification
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.notifications),
            title: const Text('Thông báo'),
          ),
          // Dark Mode
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.dark_mode),
            title: const Text('Chế độ tối'),
          ),
          //SignOut
          ListTile(
            onTap: () {
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    surfaceTintColor: Colors.white,
                    title: const Text('Đăng xuất'),
                    content: const Text('Bạn có chắc muốn đăng xuất?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Hủy'),
                      ),
                      TextButton(
                        onPressed: () {
                          injector.get<SignOutUseCase>().run();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const OnboardingScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text('Đăng xuất'),
                      ),
                    ],
                  );
                },
              );
            },
            leading: const Icon(Icons.logout),
            title: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}
