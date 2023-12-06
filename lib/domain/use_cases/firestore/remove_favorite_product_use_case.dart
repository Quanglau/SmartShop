import 'package:firebase_auth/firebase_auth.dart';
import 'package:lauquang_doan/data/repositories/firestore_repository.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class RemoveFavoriteProductUseCase implements FutureUseCase<String, void>{
  @override
  Future<void> run(String input) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
  return injector.get<FirestoreRepository>().removeFavoriteProduct(uid, input);
  }
}