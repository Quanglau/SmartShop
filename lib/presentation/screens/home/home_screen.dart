import 'package:lauquang_doan/domain/entities/flash_sale_product.dart';
import 'package:lauquang_doan/domain/entities/product_category.dart';
import 'package:lauquang_doan/domain/use_cases/scrape_web/get_home_products_use_case.dart';
import 'package:lauquang_doan/injection.dart';
import 'package:lauquang_doan/presentation/screens/detail/detail_screen.dart';
import 'package:lauquang_doan/presentation/screens/home/home_state.dart';
import 'package:lauquang_doan/presentation/screens/home/home_view_model.dart';
import 'package:lauquang_doan/presentation/screens/more_product/more_product_screen.dart';
import 'package:lauquang_doan/presentation/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lauquang_doan/presentation/screens/setting/setting_screen.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:lauquang_doan/presentation/widgets/custom_loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(
    injector.get<GetHomeProductsUseCase>(),
  ),
);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  HomeViewModel get _viewModel => ref.read(homeViewModelProvider.notifier);
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _viewModel.fetchHomeProducts);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  void addErrorMessageListener(BuildContext context) {
    ref.listen(homeViewModelProvider.select((value) => value.error),
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildSearchBar(),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SettingScreen()));
                    },
                    icon: const Icon(Icons.settings)),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            Expanded(
              child: state.loadingStatus == LoadingStatus.success
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          buildFlashSaleListView(state.flashSaleProducts),
                          const SizedBox(
                            height: 8,
                          ),
                          Image.network(
                            state.categories[state.currentCategoryIndex]
                                    .imageUrl ??
                                '',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 2,
                          ),
                          buildCategories(
                              state.categories, state.currentCategoryIndex),
                          buildCategoryGridView(
                              state.categories[state.currentCategoryIndex]),
                        ],
                      ),
                    )
                  : state.loadingStatus == LoadingStatus.error
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Có lỗi xảy ra'),
                              TextButton(
                                  onPressed: () {
                                    _viewModel.fetchHomeProducts();
                                  },
                                  child: const Text('Thử lại'))
                            ],
                          ),
                        )
                      : const CustomLoadingIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFlashSaleListView(List<FlashSaleProduct> flashSaleProducts) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Flash sale',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: flashSaleProducts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      if (!await launchUrl(
                        Uri.parse(flashSaleProducts[index].productUrl ?? ''),
                        mode: LaunchMode.externalApplication,
                      )) {
                        //show error
                        _viewModel.updateError('Không thể mở liên kết');
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: 1 / 1.2,
                      child: Card(
                        elevation: 5,
                        surfaceTintColor: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  flashSaleProducts[index].imageUrl ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              flashSaleProducts[index].price ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              flashSaleProducts[index].salePrice ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                flashSaleProducts[index].name ?? '',
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
  Widget buildCategoryGridView(ProductCategory category) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  category.name ?? 'Danh mục',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // navigate to more product screen
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MoreProductScreen(
                            path: category.seeMoreUrl ?? '',
                        name: category.name ,
                          )));
                },
                child: const Text(
                  'Xem thêm >>',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: category.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 0.8,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) =>
                  _buildProductGridViewItem(category, index),
            )),
      ],
    );
  }

  InkWell _buildProductGridViewItem(ProductCategory category, int index) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
                  product: category.products[index],
                )));
      },
      child: AspectRatio(
        aspectRatio: 1 / 1.2,
        child: Card(
          elevation: 5,
          surfaceTintColor: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  category.products[index].imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.products[index].price ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.products[index].name ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategories(List<ProductCategory> categories, int currentIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Sản phẩm gợi ý hôm nay',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                      List<Widget>.generate(categories.length ~/ 2, (index) {
                    return buildCategoryItem(
                        categories[index], index, currentIndex == index);
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List<Widget>.generate(
                      categories.length - categories.length ~/ 2, (index) {
                    final realIndex = index + categories.length ~/ 2;
                    return buildCategoryItem(categories[realIndex], realIndex,
                        currentIndex == realIndex);
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoryItem(
      ProductCategory category, int index, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () {
          _viewModel.updateCurrentCategoryIndex(index);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: isSelected ? null : Border.all(color: Colors.black54),
            color: isSelected ? Colors.deepOrange : Colors.white,
          ),
          child: Text(
            category.name ?? '',
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchScreen()));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: const Row(
            children: [
              Icon(
                Icons.search,
                size: 24,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Tìm kiếm sản phẩm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
