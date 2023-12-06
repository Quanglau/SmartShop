import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_more_product_use_case.dart';
import 'package:lauquang_doan/presentation/screens/more_product/more_product_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class MoreProductViewModel extends StateNotifier<MoreProductState> {
  MoreProductViewModel(
    this._getMoreProductUseCase,
  ) : super(const MoreProductState());
  final GetMoreProductUseCase _getMoreProductUseCase;
  Future<void> fetchMoreProducts(String path) async {
    try {
      final response = await _getMoreProductUseCase.run(path);
      state = state.copyWith(
        products: response,
        loadingStatus: LoadingStatus.success,
      );
    } catch (e) {
      state = state.copyWith(
        loadingStatus: LoadingStatus.error,
      );
    }
  }
}
