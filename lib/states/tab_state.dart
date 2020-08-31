import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_state.freezed.dart';

@freezed
abstract class TabState with _$TabState {
  const factory TabState({
    @Default(0) int currentIndex,
  }) = _TapState;
}
