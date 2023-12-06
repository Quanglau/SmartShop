import 'package:lauquang_doan/domain/use_cases/scrape_web/get_home_products_use_case.dart';
import 'package:lauquang_doan/presentation/screens/home/home_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(
    this._getHomeProductsUseCase,
  ) : super(const HomeState());
  final GetHomeProductsUseCase _getHomeProductsUseCase;
  Future<void> fetchHomeProducts() async {
    try {
      final response = await _getHomeProductsUseCase.run();
      state = state.copyWith(
        loadingStatus: LoadingStatus.success,
        categories: response.productCategories,
        flashSaleProducts: response.flashSaleProducts,
      );
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
        error: e.toString(),
      );
    }
  }

  void updateError(String error) {
    state = state.copyWith(
      error: error,
    );
  }

  void resetError() {
    state = state.copyWith(
      loadingStatus: LoadingStatus.initial,
      error: '',
    );
  }

  void updateCurrentCategoryIndex(int index) {
    state = state.copyWith(
      currentCategoryIndex: index,
    );
  }
}
