import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
part 'more_product_state.freezed.dart';

@freezed
class MoreProductState with _$MoreProductState {
  const factory MoreProductState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<Product> products,
  }) = _MoreProductState;
}
