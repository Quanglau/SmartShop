import 'package:lauquang_doan/data/repositories/authentication_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class SignOutUseCase implements OutputUseCase<void> {
  SignOutUseCase();

  @override
  Future<void> run() async {
    await injector.get<AuthenticationRepository>().signOut();
  }
}
