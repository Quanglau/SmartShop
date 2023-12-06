import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lauquang_doan/domain/entities/product.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore;
  const FirestoreRepository(this._firestore);
  String convertNameToPath(String name) {
    // remove all special characters, keep only letters and numbers
    final path = name.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    return path;
  }
  Future<void> addFavoriteProduct(
      String userId, Map<String, dynamic> product) async {
    // check if product is already in favorite list
    final isFavorite = await isFavoriteProduct(userId, product['name']);
    if (isFavorite) {
      return;
    }
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('favoriteProducts')
        .doc(convertNameToPath(product['name']))
        .set(product);
  }

  Future<bool> isFavoriteProduct(String userId, String productName) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('favoriteProducts')
        .doc(convertNameToPath(productName))
        .get();
    return snapshot.exists;
  }

  Future<List<Product>> getFavoriteProducts(String userId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('favoriteProducts')
        .get();
    return snapshot.docs.map((e) => Product.fromJson(e.data())).toList();
  }

  Future<void> removeFavoriteProduct(String userId, String productName) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('favoriteProducts')
        .doc(convertNameToPath(productName))
        .delete();
  }
}
