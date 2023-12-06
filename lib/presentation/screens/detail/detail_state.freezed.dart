// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  DetailProduct get detailProduct => throw _privateConstructorUsedError;
  Product get currentProduct => throw _privateConstructorUsedError;
  dynamic get isFavorite => throw _privateConstructorUsedError;
  dynamic get currentIndexImage => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get snackBarMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStateCopyWith<DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<$Res> {
  factory $DetailStateCopyWith(
          DetailState value, $Res Function(DetailState) then) =
      _$DetailStateCopyWithImpl<$Res, DetailState>;
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      DetailProduct detailProduct,
      Product currentProduct,
      dynamic isFavorite,
      dynamic currentIndexImage,
      String error,
      String snackBarMessage});
}

/// @nodoc
class _$DetailStateCopyWithImpl<$Res, $Val extends DetailState>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? detailProduct = null,
    Object? currentProduct = null,
    Object? isFavorite = freezed,
    Object? currentIndexImage = freezed,
    Object? error = null,
    Object? snackBarMessage = null,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      detailProduct: null == detailProduct
          ? _value.detailProduct
          : detailProduct // ignore: cast_nullable_to_non_nullable
              as DetailProduct,
      currentProduct: null == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currentIndexImage: freezed == currentIndexImage
          ? _value.currentIndexImage
          : currentIndexImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      snackBarMessage: null == snackBarMessage
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailStateImplCopyWith<$Res>
    implements $DetailStateCopyWith<$Res> {
  factory _$$DetailStateImplCopyWith(
          _$DetailStateImpl value, $Res Function(_$DetailStateImpl) then) =
      __$$DetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      DetailProduct detailProduct,
      Product currentProduct,
      dynamic isFavorite,
      dynamic currentIndexImage,
      String error,
      String snackBarMessage});
}

/// @nodoc
class __$$DetailStateImplCopyWithImpl<$Res>
    extends _$DetailStateCopyWithImpl<$Res, _$DetailStateImpl>
    implements _$$DetailStateImplCopyWith<$Res> {
  __$$DetailStateImplCopyWithImpl(
      _$DetailStateImpl _value, $Res Function(_$DetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? detailProduct = null,
    Object? currentProduct = null,
    Object? isFavorite = freezed,
    Object? currentIndexImage = freezed,
    Object? error = null,
    Object? snackBarMessage = null,
  }) {
    return _then(_$DetailStateImpl(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      detailProduct: null == detailProduct
          ? _value.detailProduct
          : detailProduct // ignore: cast_nullable_to_non_nullable
              as DetailProduct,
      currentProduct: null == currentProduct
          ? _value.currentProduct
          : currentProduct // ignore: cast_nullable_to_non_nullable
              as Product,
      isFavorite: freezed == isFavorite ? _value.isFavorite! : isFavorite,
      currentIndexImage: freezed == currentIndexImage
          ? _value.currentIndexImage!
          : currentIndexImage,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      snackBarMessage: null == snackBarMessage
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailStateImpl implements _DetailState {
  const _$DetailStateImpl(
      {this.loadingStatus = LoadingStatus.initial,
      this.detailProduct = const DetailProduct.empty(),
      this.currentProduct = const Product.empty(),
      this.isFavorite = false,
      this.currentIndexImage = 0,
      this.error = '',
      this.snackBarMessage = ''});

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  @override
  @JsonKey()
  final DetailProduct detailProduct;
  @override
  @JsonKey()
  final Product currentProduct;
  @override
  @JsonKey()
  final dynamic isFavorite;
  @override
  @JsonKey()
  final dynamic currentIndexImage;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String snackBarMessage;

  @override
  String toString() {
    return 'DetailState(loadingStatus: $loadingStatus, detailProduct: $detailProduct, currentProduct: $currentProduct, isFavorite: $isFavorite, currentIndexImage: $currentIndexImage, error: $error, snackBarMessage: $snackBarMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStateImpl &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.detailProduct, detailProduct) ||
                other.detailProduct == detailProduct) &&
            (identical(other.currentProduct, currentProduct) ||
                other.currentProduct == currentProduct) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite) &&
            const DeepCollectionEquality()
                .equals(other.currentIndexImage, currentIndexImage) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.snackBarMessage, snackBarMessage) ||
                other.snackBarMessage == snackBarMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      detailProduct,
      currentProduct,
      const DeepCollectionEquality().hash(isFavorite),
      const DeepCollectionEquality().hash(currentIndexImage),
      error,
      snackBarMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      __$$DetailStateImplCopyWithImpl<_$DetailStateImpl>(this, _$identity);
}

abstract class _DetailState implements DetailState {
  const factory _DetailState(
      {final LoadingStatus loadingStatus,
      final DetailProduct detailProduct,
      final Product currentProduct,
      final dynamic isFavorite,
      final dynamic currentIndexImage,
      final String error,
      final String snackBarMessage}) = _$DetailStateImpl;

  @override
  LoadingStatus get loadingStatus;
  @override
  DetailProduct get detailProduct;
  @override
  Product get currentProduct;
  @override
  dynamic get isFavorite;
  @override
  dynamic get currentIndexImage;
  @override
  String get error;
  @override
  String get snackBarMessage;
  @override
  @JsonKey(ignore: true)
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
