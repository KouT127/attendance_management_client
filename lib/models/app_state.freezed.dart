// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$AppState {
  bool get initialLoaded;

  AppState copyWith({bool initialLoaded});
}

class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call({bool initialLoaded}) {
    return _AppState(
      initialLoaded: initialLoaded,
    );
  }
}

const $AppState = _$AppStateTearOff();

class _$_AppState with DiagnosticableTreeMixin implements _AppState {
  const _$_AppState({this.initialLoaded});

  @override
  final bool initialLoaded;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(initialLoaded: $initialLoaded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('initialLoaded', initialLoaded));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.initialLoaded, initialLoaded) ||
                const DeepCollectionEquality()
                    .equals(other.initialLoaded, initialLoaded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(initialLoaded);

  @override
  _$_AppState copyWith({
    Object initialLoaded = freezed,
  }) {
    return _$_AppState(
      initialLoaded:
          initialLoaded == freezed ? this.initialLoaded : initialLoaded as bool,
    );
  }
}

abstract class _AppState implements AppState {
  const factory _AppState({bool initialLoaded}) = _$_AppState;

  @override
  bool get initialLoaded;

  @override
  _AppState copyWith({bool initialLoaded});
}
