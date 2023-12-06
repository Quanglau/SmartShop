import 'package:lauquang_doan/data/repositories/authentication_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class IsSignedInUseCase implements OutputUseCase<bool> {
  @override
  bool run() {
    return injector.get<AuthenticationRepository>().isSignedIn();
  }
}
