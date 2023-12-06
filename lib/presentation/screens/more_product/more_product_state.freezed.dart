// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoreProductState {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoreProductStateCopyWith<MoreProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreProductStateCopyWith<$Res> {
  factory $MoreProductStateCopyWith(
          MoreProductState value, $Res Function(MoreProductState) then) =
      _$MoreProductStateCopyWithImpl<$Res, MoreProductState>;
  @useResult
  $Res call({LoadingStatus loadingStatus, List<Product> products});
}

/// @nodoc
class _$MoreProductStateCopyWithImpl<$Res, $Val extends MoreProductState>
    implements $MoreProductStateCopyWith<$Res> {
  _$MoreProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoreProductStateImplCopyWith<$Res>
    implements $MoreProductStateCopyWith<$Res> {
  factory _$$MoreProductStateImplCopyWith(_$MoreProductStateImpl value,
          $Res Function(_$MoreProductStateImpl) then) =
      __$$MoreProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadingStatus loadingStatus, List<Product> products});
}

/// @nodoc
class __$$MoreProductStateImplCopyWithImpl<$Res>
    extends _$MoreProductStateCopyWithImpl<$Res, _$MoreProductStateImpl>
    implements _$$MoreProductStateImplCopyWith<$Res> {
  __$$MoreProductStateImplCopyWithImpl(_$MoreProductStateImpl _value,
      $Res Function(_$MoreProductStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? products = null,
  }) {
    return _then(_$MoreProductStateImpl(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$MoreProductStateImpl implements _MoreProductState {
  const _$MoreProductStateImpl(
      {this.loadingStatus = LoadingStatus.initial,
      final List<Product> products = const []})
      : _products = products;

  @override
  @JsonKey()
  final LoadingStatus loadingStatus;
  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'MoreProductState(loadingStatus: $loadingStatus, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoreProductStateImpl &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoreProductStateImplCopyWith<_$MoreProductStateImpl> get copyWith =>
      __$$MoreProductStateImplCopyWithImpl<_$MoreProductStateImpl>(
          this, _$identity);
}

abstract class _MoreProductState implements MoreProductState {
  const factory _MoreProductState(
      {final LoadingStatus loadingStatus,
      final List<Product> products}) = _$MoreProductStateImpl;

  @override
  LoadingStatus get loadingStatus;
  @override
  List<Product> get products;
  @override
  @JsonKey(ignore: true)
  _$$MoreProductStateImplCopyWith<_$MoreProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
