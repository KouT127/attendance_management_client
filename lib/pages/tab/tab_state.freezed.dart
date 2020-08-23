// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$TabState {
  int get currentIndex;

  TabState copyWith({int currentIndex});
}

class _$TabStateTearOff {
  const _$TabStateTearOff();

  _TapState call({int currentIndex = 0}) {
    return _TapState(
      currentIndex: currentIndex,
    );
  }
}

const $TabState = _$TabStateTearOff();

class _$_TapState with DiagnosticableTreeMixin implements _TapState {
  const _$_TapState({this.currentIndex = 0});

  @JsonKey(defaultValue: 0)
  @override
  final int currentIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TabState(currentIndex: $currentIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TabState'))
      ..add(DiagnosticsProperty('currentIndex', currentIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TapState &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(currentIndex);

  @override
  _$_TapState copyWith({
    Object currentIndex = freezed,
  }) {
    return _$_TapState(
      currentIndex:
          currentIndex == freezed ? this.currentIndex : currentIndex as int,
    );
  }
}

abstract class _TapState implements TabState {
  const factory _TapState({int currentIndex}) = _$_TapState;

  @override
  int get currentIndex;

  @override
  _TapState copyWith({int currentIndex});
}
