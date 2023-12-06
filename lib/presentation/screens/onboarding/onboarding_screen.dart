import 'package:flutter/material.dart';
import 'package:lauquang_doan/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:lauquang_doan/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:lauquang_doan/presentation/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                'Chào mừng',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          CustomButton(
              text: 'Đăng nhập với Email',
              height: 60,
              textColor: Colors.white,
              fontWeight: FontWeight.w600,
              image: const Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              }),
          SizedBox(
            height: 16,
          ),
          CustomButton(
              text: 'Đăng ký',
              height: 60,
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
              buttonColor: const Color(0xFFEBECEE),
              image: const Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              }),
          Flexible(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
