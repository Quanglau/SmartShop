import 'package:firebase_auth/firebase_auth.dart';
import 'package:lauquang_doan/data/repositories/firestore_repository.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class AddFavoriteProductUseCase implements FutureUseCase<Product, void> {
  @override
  Future<void> run(Product input) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return injector
        .get<FirestoreRepository>()
        .addFavoriteProduct(uid, input.toJson());
  }
}
