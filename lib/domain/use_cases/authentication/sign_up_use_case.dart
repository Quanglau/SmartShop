import 'package:firebase_auth/firebase_auth.dart';
import 'package:lauquang_doan/data/repositories/authentication_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class SignUpUseCase implements FutureUseCase<SignUpParams, UserCredential> {
  SignUpUseCase();

  @override
  Future<UserCredential> run(SignUpParams input) async {
    return await injector
        .get<AuthenticationRepository>()
        .signUp(input.email, input.password);
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}
