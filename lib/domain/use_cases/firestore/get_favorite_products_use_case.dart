import 'package:firebase_auth/firebase_auth.dart';
import 'package:lauquang_doan/data/repositories/firestore_repository.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/domain/use_cases/use_case.dart';
import 'package:lauquang_doan/injection.dart';

class GetFavoriteProductsUseCase implements FutureOutputUseCase<List<Product>> {
  @override
  Future<List<Product>> run() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return injector.get<FirestoreRepository>().getFavoriteProducts(
        uid
    );
  }

}