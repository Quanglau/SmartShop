import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(LoadingStatus.initial) LoadingStatus searchLoadingStatus,
    @Default([]) List<Product> productList,
  }) = _SearchState;
}
