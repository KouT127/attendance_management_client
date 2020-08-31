import 'package:attendance_management/states/states.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    String email,
    String password,
    UserState user,
  }) = _LoginState;
}
