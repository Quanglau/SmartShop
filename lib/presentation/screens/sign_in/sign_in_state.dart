import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default(true) bool isPasswordVisible,
    @Default('') String errorCode,
  }) = _SignInState;
}
