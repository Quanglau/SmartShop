import 'package:lauquang_doan/domain/entities/flash_sale_product.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/domain/entities/product_category.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<ProductCategory> categories,
    @Default([]) List<FlashSaleProduct> flashSaleProducts,
    @Default(0) currentCategoryIndex,
    @Default('') String error,
  }) = _HomeState;
}
