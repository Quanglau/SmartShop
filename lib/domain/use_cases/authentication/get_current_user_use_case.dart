import 'package:firebase_auth/firebase_auth.dart';
import 'package:lauquang_doan/data/repositories/authentication_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class GetCurrentUserUseCase implements OutputUseCase<User> {
  @override
  User run() {
    return injector.get<AuthenticationRepository>().getCurrentUser();
  }
}
