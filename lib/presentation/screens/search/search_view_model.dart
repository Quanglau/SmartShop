import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/search_product_list_use_case.dart';
import 'package:lauquang_doan/presentation/screens/search/search_state.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel(
    this._searchProductListUseCase,
  ) : super(const SearchState());
  final SearchProductListFromUseCase _searchProductListUseCase;
  final searchTextController = TextEditingController();
  final focusNode = FocusNode();
  Future<void> onSearch() async {
    if (!mounted) return;
    try {
      state = state.copyWith(
        searchLoadingStatus: LoadingStatus.loading,
      );
      if (searchTextController.value.text.isEmpty) {
        state = state.copyWith(
          searchLoadingStatus: LoadingStatus.success,
          productList: [],
        );
        return;
      }
      final productList =
          await _searchProductListUseCase.run(searchTextController.value.text);
      state = state.copyWith(
        searchLoadingStatus: LoadingStatus.success,
        productList: productList,
      );
    } catch (e) {
      debugPrint(e.toString());
      if (!mounted) return;
      state = state.copyWith(
        searchLoadingStatus: LoadingStatus.error,
      );
    }
  }

  @override
  void dispose() {
    searchTextController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
