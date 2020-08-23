// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$AppState {
  bool get initialLoaded;
  UserState get userState;

  AppState copyWith({bool initialLoaded, UserState userState});
}

class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call({bool initialLoaded, UserState userState}) {
    return _AppState(
      initialLoaded: initialLoaded,
      userState: userState,
    );
  }
}

const $AppState = _$AppStateTearOff();

class _$_AppState with DiagnosticableTreeMixin implements _AppState {
  const _$_AppState({this.initialLoaded, this.userState});

  @override
  final bool initialLoaded;
  @override
  final UserState userState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(initialLoaded: $initialLoaded, userState: $userState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('initialLoaded', initialLoaded))
      ..add(DiagnosticsProperty('userState', userState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.initialLoaded, initialLoaded) ||
                const DeepCollectionEquality()
                    .equals(other.initialLoaded, initialLoaded)) &&
            (identical(other.userState, userState) ||
                const DeepCollectionEquality()
                    .equals(other.userState, userState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialLoaded) ^
      const DeepCollectionEquality().hash(userState);

  @override
  _$_AppState copyWith({
    Object initialLoaded = freezed,
    Object userState = freezed,
  }) {
    return _$_AppState(
      initialLoaded:
          initialLoaded == freezed ? this.initialLoaded : initialLoaded as bool,
      userState: userState == freezed ? this.userState : userState as UserState,
    );
  }
}

abstract class _AppState implements AppState {
  const factory _AppState({bool initialLoaded, UserState userState}) =
      _$_AppState;

  @override
  bool get initialLoaded;
  @override
  UserState get userState;

  @override
  _AppState copyWith({bool initialLoaded, UserState userState});
}
