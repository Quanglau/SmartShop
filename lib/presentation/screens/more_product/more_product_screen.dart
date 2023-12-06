import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_more_product_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/detail/detail_screen.dart';
import 'package:lauquang_doan/presentation/screens/more_product/more_product_state.dart';
import 'package:lauquang_doan/presentation/screens/more_product/more_product_view_model.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/widgets/custom_loading_indicator.dart';
import 'package:lauquang_doan/presentation/widgets/product_grid_item_view.dart';

final moreProductViewModel =
    StateNotifierProvider.autoDispose<MoreProductViewModel, MoreProductState>(
        (ref) {
  return MoreProductViewModel(
    injector.get<GetMoreProductUseCase>(),
  );
});

class MoreProductScreen extends ConsumerStatefulWidget {
  final String path;
  final String? name;
  const MoreProductScreen({Key? key, required this.path, this.name}) : super(key: key);

  @override
  ConsumerState<MoreProductScreen> createState() => _MoreProductScreenState();
}

class _MoreProductScreenState extends ConsumerState<MoreProductScreen> {
  MoreProductViewModel get viewModel => ref.read(moreProductViewModel.notifier);
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        viewModel.fetchMoreProducts(widget.path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(moreProductViewModel);
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
          ),
          title: Text(widget.name ?? ''),
        centerTitle: true,
        ),
        body: state.loadingStatus == LoadingStatus.success
            ? GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                children: state.products
                    .map(
                      (product) => ProductGridItemView(
                        product: product,
                        onTap: (path) async {
                          // navigate to detail screen

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                product: product,
                              )));
                        },
                      ),
                    )
                    .toList(),
              )
            : const CustomLoadingIndicator());
  }
}
