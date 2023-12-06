import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lauquang_doan/presentation/utilities/enums/loading_status.dart';
part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default('') String error,
    @Default(null) File? avatar,
  }) = _AccountState;
}
