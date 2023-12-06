import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/add_favorite_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/firestore/is_favorite_product_use_case.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_detail_product_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/detail/detail_state.dart';
import 'package:lauquang_doan/presentation/screens/detail/detail_view_model.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/widgets/custom_loading_indicator.dart';
import 'package:lauquang_doan/presentation/widgets/product_grid_item_view.dart';
import 'package:url_launcher/url_launcher.dart';

final detailViewModelProvider =
    StateNotifierProvider.autoDispose<DetailViewModel, DetailState>(
  (ref) => DetailViewModel(
    injector.get<GetDetailProductUseCase>(),
    injector.get<AddFavoriteProductUseCase>(),
    injector.get<IsFavoriteProductUseCase>(),
  ),
);

class DetailScreen extends ConsumerStatefulWidget {
  final Product? product;

  const DetailScreen({this.product, super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  DetailViewModel get _viewModel => ref.read(detailViewModelProvider.notifier);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _viewModel.updateCurrentProduct(widget.product ?? const Product.empty());
      _viewModel.fetchIsFavoriteProduct();
      _viewModel.fetchDetailProduct(widget.product?.productUrl);
    });
  }

  void addErrorMessageListener(BuildContext context) {
    ref.listen(detailViewModelProvider.select((value) => value.error),
        (previous, next) {
      if (next.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next),
            backgroundColor: Colors.red,
          ),
        );
      }
      _viewModel.resetError();
    });
  }

  void addSnackBarListener(BuildContext context) {
    ref.listen(detailViewModelProvider.select((value) => value.snackBarMessage),
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
      _viewModel.resetSnackBarMessage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(detailViewModelProvider);
    addErrorMessageListener(context);
    addSnackBarListener(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('So sánh giá'),
        centerTitle: true,
      ),
      body: state.loadingStatus == LoadingStatus.success
          ? buildLoadingSuccessBody(state)
          : const CustomLoadingIndicator(),
    );
  }

  SingleChildScrollView buildLoadingSuccessBody(DetailState state) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildCarouselSlider(state),
        const SizedBox(height: 8),
        Center(
          child: DotsIndicator(
            dotsCount: state.detailProduct.galleryImageUrls.length,
            position: state.currentIndexImage,
            decorator: const DotsDecorator(
              color: Colors.grey,
              activeColor: Colors.deepOrange,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(state.detailProduct.name ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(width: 16),
            // favorite button
            IconButton(
              onPressed: _viewModel.onTapFavorite,
              iconSize: 28,
              icon: state.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
            const SizedBox(width: 16),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            children: [
              const Text('Giá từ: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              Text(state.detailProduct.price ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
        buildCompareProducts(state),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Text('Sản phẩm tương tự ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 0.8,
              ),
              itemCount: state.detailProduct.similarProducts.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final product = state.detailProduct.similarProducts[index];
                return ProductGridItemView(
                    onTap: (String path) {
                      _viewModel.tapToDifferentProduct(path);
                    },
                    product: product);
              },
            )),
      ]),
    );
  }

  SizedBox buildCompareProducts(DetailState state) {
    return SizedBox(
        height: 180,
        child: ListView.builder(
          itemCount: state.detailProduct.compareProducts.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final product = state.detailProduct.compareProducts[index];
            return Card(
              elevation: 2,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Image.network(
                      product.imageUrl ?? '',
                      fit: BoxFit.cover,
                      height: 32,
                      width: 90,
                    ),
                    const SizedBox(height: 16),
                    Text(product.price ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        )),
                    const SizedBox(height: 16),
                    ActionChip(
                      side: BorderSide.none,
                      backgroundColor: Colors.deepOrange,
                      label: const Text('Mua ngay',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      onPressed: () async {
                        String path = product.productUrl ?? '';
                        if (!await launchUrl(
                          Uri.parse('https://websosanh.vn$path'),
                          mode: LaunchMode.externalApplication,
                        )) {
                          //show error
                          _viewModel.updateError('Không thể mở liên kết');
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  CarouselSlider buildCarouselSlider(DetailState state) {
    return CarouselSlider(
        items: state.detailProduct.galleryImageUrls
            .map((url) => Image.network(
                  url ?? '',
                  fit: BoxFit.cover,
                  height: 200,
                ))
            .toList(),
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          initialPage: 0,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 8),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            _viewModel.updateCurrentIndexImage(index);
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}


