import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/add_favorite_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/is_favorite_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_detail_product_use_case.dart';
import 'package:lauquang_doan/presentation/screens/detail/detail_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class DetailViewModel extends StateNotifier<DetailState> {
  DetailViewModel(
    this._getDetailProductUseCase,
    this._addFavoriteProductUseCase,
    this._isFavoriteProductUseCase,
  ) : super(const DetailState());
  final GetDetailProductUseCase _getDetailProductUseCase;
  final AddFavoriteProductUseCase _addFavoriteProductUseCase;
  final IsFavoriteProductUseCase _isFavoriteProductUseCase;
  void updateCurrentProduct(Product product) {
    state = state.copyWith(
      currentProduct: product,
    );
  }
  Future<void> fetchDetailProduct(String? path) async {
    if (!mounted) return;
    state = state.copyWith(
      loadingStatus: LoadingStatus.loading,
    );
    try {
      final detailProduct = await _getDetailProductUseCase.run(path);
      if (!mounted) return;
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
        detailProduct: detailProduct,
      );
    } catch (e) {
      debugPrint(e.toString());
      if (!mounted) return;
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
      );
    }
  }
void fetchIsFavoriteProduct() async {
    try {
      final isFavorite = await _isFavoriteProductUseCase.run(state.currentProduct.name ?? '');
      if (!mounted) return;
      state = state.copyWith(
        isFavorite: isFavorite,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateCurrentIndexImage(int index) {
    state = state.copyWith(
      currentIndexImage: index,
    );
  }

  void updateError(String s) {
    state = state.copyWith(
      error: s,
    );
  }

  void resetError() {
    state = state.copyWith(
      error: '',
    );
  }

  void tapToDifferentProduct(String? path) {
    // remove https://websosanh.vn/
    final correctPath = path?.substring(21);
    fetchDetailProduct(correctPath);
  }

  Future<void> addFavoriteProduct() async {
    await _addFavoriteProductUseCase.run(state.currentProduct);
  }

  void onTapFavorite() {
    state = state.copyWith(
      isFavorite: !state.isFavorite,
    );
    if (state.isFavorite) {
      addFavoriteProduct();
      state = state.copyWith(
        snackBarMessage: 'Đã thêm vào danh sách yêu thích',
      );
    }
  }
  void resetSnackBarMessage() {
    state = state.copyWith(
      snackBarMessage: '',
    );
  }
}
