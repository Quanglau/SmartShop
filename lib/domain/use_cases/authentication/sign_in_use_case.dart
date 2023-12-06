import 'package:firebase_auth/firebase_auth.dart';
import 'package:lauquang_doan/data/repositories/authentication_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class SignInUseCase
    implements FutureUseCase<SignInWithEmailParams, UserCredential> {
  SignInUseCase();

  @override
  Future<UserCredential> run(SignInWithEmailParams input) async {
    return await injector
        .get<AuthenticationRepository>()
        .signIn(input.email, input.password);
  }
}

class SignInWithEmailParams {
  final String email;
  final String password;

  SignInWithEmailParams({required this.email, required this.password});
}
