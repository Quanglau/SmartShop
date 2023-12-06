import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/get_favorite_products_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/remove_favorite_product_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/detail/detail_screen.dart';
import 'package:lauquang_doan/presentation/screens/favorite/favorite_state.dart';
import 'package:lauquang_doan/presentation/screens/favorite/favorite_view_model.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/widgets/custom_loading_indicator.dart';
import 'package:lauquang_doan/presentation/widgets/product_list_view_item.dart';
final favoriteViewModelProvider = StateNotifierProvider.autoDispose<FavoriteViewModel, FavoriteState>(
      (ref) => FavoriteViewModel(
        injector.get<GetFavoriteProductsUseCase>(),
        injector.get<RemoveFavoriteProductUseCase>(),
      ),
);
class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {

  FavoriteViewModel get _viewModel => ref.read(favoriteViewModelProvider.notifier);

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
          () => _viewModel.fetchFavoriteProducts(),
    );
  }
  void onDeleteTap(String productName) {
    // show dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Xóa sản phẩm khỏi danh sách yêu thích'),
          content: const Text('Bạn có chắc chắn muốn xóa sản phẩm này khỏi danh sách yêu thích?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                _viewModel.removeFavoriteProduct(productName);
                Navigator.pop(context);
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }
  void onErrorListener(BuildContext context){
    ref.listen(favoriteViewModelProvider.select((value) => value.error),
            (previous, next) {
          if (next.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(

              SnackBar(
                duration: const Duration(seconds: 2),
                content: Text(next),
                backgroundColor: Colors.green,
              ),
            );
          }
          _viewModel.resetError();
        });
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(favoriteViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách yêu thích'),
      ),
      body: state.loadingStatus == LoadingStatus.success
        ? ListView.builder(
        itemCount: state.favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = state.favoriteProducts[index];
          return ProductListViewItem(
            onDeteteTap: onDeleteTap,
            isShowShopName: false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    product: product,
                  ),
              ),
              );
            },
              product: product);
        },
      )
          : const Center(
        child: CustomLoadingIndicator(),
      ),

    );
  }
}
