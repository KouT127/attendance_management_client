import 'package:attendance_management/states/user_state.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({bool initialLoaded, UserState userState}) = _AppState;
}
