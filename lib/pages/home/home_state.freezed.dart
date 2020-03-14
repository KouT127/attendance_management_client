// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$HomeState {
  DateTime get datetime;
  User get user;

  HomeState copyWith({DateTime datetime, User user});
}

class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call({DateTime datetime, User user}) {
    return _HomeState(
      datetime: datetime,
      user: user,
    );
  }
}

const $HomeState = _$HomeStateTearOff();

class _$_HomeState implements _HomeState {
  const _$_HomeState({this.datetime, this.user});

  @override
  final DateTime datetime;
  @override
  final User user;

  @override
  String toString() {
    return 'HomeState(datetime: $datetime, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.datetime, datetime) ||
                const DeepCollectionEquality()
                    .equals(other.datetime, datetime)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(datetime) ^
      const DeepCollectionEquality().hash(user);

  @override
  _$_HomeState copyWith({
    Object datetime = freezed,
    Object user = freezed,
  }) {
    return _$_HomeState(
      datetime: datetime == freezed ? this.datetime : datetime as DateTime,
      user: user == freezed ? this.user : user as User,
    );
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({DateTime datetime, User user}) = _$_HomeState;

  @override
  DateTime get datetime;
  @override
  User get user;

  @override
  _HomeState copyWith({DateTime datetime, User user});
}
