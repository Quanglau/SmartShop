import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lauquang_doan/domain/entities/detail_product.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default(DetailProduct.empty()) DetailProduct detailProduct,
    @Default(Product.empty()) Product currentProduct,
    @Default(false) isFavorite,
    @Default(0) currentIndexImage,
    @Default('') String error,
    @Default('') String snackBarMessage,
  }) = _DetailState;
}
