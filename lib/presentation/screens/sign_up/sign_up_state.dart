import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default(true) bool isPasswordVisible,
    @Default('') String errorCode,
  }) = _SignUpState;
}
