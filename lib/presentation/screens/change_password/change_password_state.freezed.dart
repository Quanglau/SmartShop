// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangePasswordState {
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  String get errorCode => throw _privateConstructorUsedError;
  String get snackBarMessage => throw _privateConstructorUsedError;
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordStateCopyWith<ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordStateCopyWith(
          ChangePasswordState value, $Res Function(ChangePasswordState) then) =
      _$ChangePasswordStateCopyWithImpl<$Res, ChangePasswordState>;
  @useResult
  $Res call(
      {bool isPasswordVisible,
      String errorCode,
      String snackBarMessage,
      LoadingStatus loadingStatus});
}

/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res, $Val extends ChangePasswordState>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPasswordVisible = null,
    Object? errorCode = null,
    Object? snackBarMessage = null,
    Object? loadingStatus = null,
  }) {
    return _then(_value.copyWith(
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      snackBarMessage: null == snackBarMessage
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordStateImplCopyWith<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  factory _$$ChangePasswordStateImplCopyWith(_$ChangePasswordStateImpl value,
          $Res Function(_$ChangePasswordStateImpl) then) =
      __$$ChangePasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isPasswordVisible,
      String errorCode,
      String snackBarMessage,
      LoadingStatus loadingStatus});
}

/// @nodoc
class __$$ChangePasswordStateImplCopyWithImpl<$Res>
    extends _$ChangePasswordStateCopyWithImpl<$Res, _$ChangePasswordStateImpl>
    implements _$$ChangePasswordStateImplCopyWith<$Res> {
  __$$ChangePasswordStateImplCopyWithImpl(_$ChangePasswordStateImpl _value,
      $Res Function(_$ChangePasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPasswordVisible = null,
    Object? errorCode = null,
    Object? snackBarMessage = null,
    Object? loadingStatus = null,
  }) {
    return _then(_$ChangePasswordStateImpl(
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      snackBarMessage: null == snackBarMessage
          ? _value.snackBarMessage
          : snackBarMessage // ignore: cast_nullable_to_non_nullable
              as String,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$ChangePasswordStateImpl implements _ChangePasswordState {
  const _$ChangePasswordStateImpl(
      {this.isPasswordVisible = false,
      this.errorCode = '',
      this.snackBarMessage = '',
      this.loadingStatus = LoadingStatus.initial});

  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final String errorCode;
  @override
  @JsonKey()
  final String snackBarMessage;
  @override
  @JsonKey()
  final LoadingStatus loadingStatus;

  @override
  String toString() {
    return 'ChangePasswordState(isPasswordVisible: $isPasswordVisible, errorCode: $errorCode, snackBarMessage: $snackBarMessage, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordStateImpl &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.snackBarMessage, snackBarMessage) ||
                other.snackBarMessage == snackBarMessage) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPasswordVisible, errorCode,
      snackBarMessage, loadingStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      __$$ChangePasswordStateImplCopyWithImpl<_$ChangePasswordStateImpl>(
          this, _$identity);
}

abstract class _ChangePasswordState implements ChangePasswordState {
  const factory _ChangePasswordState(
      {final bool isPasswordVisible,
      final String errorCode,
      final String snackBarMessage,
      final LoadingStatus loadingStatus}) = _$ChangePasswordStateImpl;

  @override
  bool get isPasswordVisible;
  @override
  String get errorCode;
  @override
  String get snackBarMessage;
  @override
  LoadingStatus get loadingStatus;
  @override
  @JsonKey(ignore: true)
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
