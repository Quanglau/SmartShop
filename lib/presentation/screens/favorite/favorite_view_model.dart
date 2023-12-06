import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/get_favorite_products_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/remove_favorite_product_use_case.dart';
import 'package:lauquang_doan/presentation/screens/favorite/favorite_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class FavoriteViewModel extends StateNotifier<FavoriteState> {
  FavoriteViewModel(
    this._getFavoriteProductsUseCase,
    this._removeFavoriteProductUseCase,
      ) : super(const FavoriteState());
  final GetFavoriteProductsUseCase _getFavoriteProductsUseCase;
  final RemoveFavoriteProductUseCase _removeFavoriteProductUseCase;
  Future<void> fetchFavoriteProducts() async {
    if (!mounted) return;
    state = state.copyWith(
      loadingStatus: LoadingStatus.loading,
    );
    try {
      final favoriteProducts = await _getFavoriteProductsUseCase.run();
      if (!mounted) return;
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
        favoriteProducts: favoriteProducts,
      );
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        error: e.toString(),
      );
    }
  }
  Future<void> removeFavoriteProduct(String productName) async {
    if (!mounted) return;
    state = state.copyWith(
      loadingStatus: LoadingStatus.loading,
    );
    try {
      await _removeFavoriteProductUseCase.run(productName);
      if (!mounted) return;
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
      );
      fetchFavoriteProducts();
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        error: e.toString(),
      );
    }
  }

  void resetError() {
    state = state.copyWith(
      error: '',
    );
  }
}