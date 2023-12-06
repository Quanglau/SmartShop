import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<Product> favoriteProducts,
    @Default('') String error,
  }) = _FavoriteState;
}