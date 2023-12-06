import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/search_product_list_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/search/search_state.dart';
import 'package:lauquang_doan/presentation/screens/search/search_view_model.dart';
import 'package:lauquang_doan/presentation/screens/webview/webview_screen.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/widgets/custom_loading_indicator.dart';
import 'package:lauquang_doan/presentation/widgets/custom_search_bar.dart';
import 'package:lauquang_doan/presentation/widgets/product_list_view_item.dart';
import 'package:url_launcher/url_launcher.dart';

final searchViewModelProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
  (ref) => SearchViewModel(
    injector.get<SearchProductListFromUseCase>(),
  ),
);

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  SearchViewModel get _viewModel => ref.read(searchViewModelProvider.notifier);
  @override
  void initState() {
    super.initState();
    _viewModel.focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const BackButton(),
                Expanded(
                  child: CustomSearchBar(
                    textEditingController: _viewModel.searchTextController,
                    focusNode: _viewModel.focusNode,
                    onSubmitted: _viewModel.onSearch,
                  ),
                ),
                TextButton(
                    onPressed: _viewModel.onSearch,
                    child:
                        const Text('Tìm kiếm', style: TextStyle(fontSize: 12))),
              ],
            ),
            Expanded(
                child: state.searchLoadingStatus == LoadingStatus.loading
                    ? const CustomLoadingIndicator()
                    : ListView.builder(
                        itemCount: state.productList.length,
                        itemBuilder: (context, index) {
                          return ProductListViewItem(
                            onTap: () async {
                              //check url contrains shopee, lazada
                              final url = state.productList[index].productUrl ?? '';
                              if (url.contains('shopee.vn') || url.contains('lazada.vn')) {
                                if (await launchUrl(
                                  Uri.parse(url),
                                  mode: LaunchMode.externalApplication,
                                )) {
                                  return;
                                }
                              }
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => WebViewScreen(url, state.productList[index].shop ?? ''),
                                ),
                              );
                            },
                              product: state.productList[index]);
                        },
                      )),
          ],
        ),
      ),
    );
  }

}
