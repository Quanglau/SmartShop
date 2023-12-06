// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  List<ProductCategory> get categories => throw _privateConstructorUsedError;
  List<FlashSaleProduct> get flashSaleProducts =>
      throw _privateConstructorUsedError;
  dynamic get currentCategoryIndex => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      List<ProductCategory> categories,
      List<FlashSaleProduct> flashSaleProducts,
      dynamic currentCategoryIndex,
      String error});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? categories = null,
    Object? flashSaleProducts = null,
    Object? currentCategoryIndex = freezed,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      flashSaleProducts: null == flashSaleProducts
          ? _value.flashSaleProducts
          : flashSaleProducts // ignore: cast_nullable_to_non_nullable
              as List<FlashSaleProduct>,
      currentCategoryIndex: freezed == currentCategoryIndex
          ? _value.currentCategoryIndex
          : currentCategoryIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      List<ProductCategory> categories,
      List<FlashSaleProduct> flashSaleProducts,
      dynamic currentCategoryIndex,
      String error});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? categories = null,
    Object? flashSaleProducts = null,
    Object? currentCategoryIndex = freezed,
    Object? error = null,
  }) {
    return _then(_$HomeStateImpl(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      flashSaleProducts: null == flashSaleProducts
          ? _value._flashSaleProducts
          : flashSaleProducts // ignore: cast_nullable_to_non_nullable
              as List<FlashSaleProduct>,
      currentCategoryIndex: freezed == currentCategoryIndex
          ? _value.currentCategoryIndex!
          : currentCategoryIndex,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.loadingStatus = LoadingStatus.initial,
      final List<ProductCategory> categories = const [],
      final List<FlashSaleProduct> flashSaleProducts = const [],
      this.currentCategoryIndex = 0,
      this.error = ''})
      : _categories = categories,
        _flashSaleProducts = flashSaleProducts;

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  final List<ProductCategory> _categories;
  @override
  @JsonKey()
  List<ProductCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<FlashSaleProduct> _flashSaleProducts;
  @override
  @JsonKey()
  List<FlashSaleProduct> get flashSaleProducts {
    if (_flashSaleProducts is EqualUnmodifiableListView)
      return _flashSaleProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flashSaleProducts);
  }

  @override
  @JsonKey()
  final dynamic currentCategoryIndex;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'HomeState(loadingStatus: $loadingStatus, categories: $categories, flashSaleProducts: $flashSaleProducts, currentCategoryIndex: $currentCategoryIndex, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._flashSaleProducts, _flashSaleProducts) &&
            const DeepCollectionEquality()
                .equals(other.currentCategoryIndex, currentCategoryIndex) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadingStatus,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_flashSaleProducts),
      const DeepCollectionEquality().hash(currentCategoryIndex),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final LoadingStatus loadingStatus,
      final List<ProductCategory> categories,
      final List<FlashSaleProduct> flashSaleProducts,
      final dynamic currentCategoryIndex,
      final String error}) = _$HomeStateImpl;

  @override
  LoadingStatus get loadingStatus;
  @override
  List<ProductCategory> get categories;
  @override
  List<FlashSaleProduct> get flashSaleProducts;
  @override
  dynamic get currentCategoryIndex;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
