// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$HomeState {
  String get formattedDate;
  String get formattedTime;
  User get user;

  HomeState copyWith({String formattedDate, String formattedTime, User user});
}

class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call({String formattedDate, String formattedTime, User user}) {
    return _HomeState(
      formattedDate: formattedDate,
      formattedTime: formattedTime,
      user: user,
    );
  }
}

const $HomeState = _$HomeStateTearOff();

class _$_HomeState implements _HomeState {
  const _$_HomeState({this.formattedDate, this.formattedTime, this.user});

  @override
  final String formattedDate;
  @override
  final String formattedTime;
  @override
  final User user;

  @override
  String toString() {
    return 'HomeState(formattedDate: $formattedDate, formattedTime: $formattedTime, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.formattedDate, formattedDate) ||
                const DeepCollectionEquality()
                    .equals(other.formattedDate, formattedDate)) &&
            (identical(other.formattedTime, formattedTime) ||
                const DeepCollectionEquality()
                    .equals(other.formattedTime, formattedTime)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(formattedDate) ^
      const DeepCollectionEquality().hash(formattedTime) ^
      const DeepCollectionEquality().hash(user);

  @override
  _$_HomeState copyWith({
    Object formattedDate = freezed,
    Object formattedTime = freezed,
    Object user = freezed,
  }) {
    return _$_HomeState(
      formattedDate: formattedDate == freezed
          ? this.formattedDate
          : formattedDate as String,
      formattedTime: formattedTime == freezed
          ? this.formattedTime
          : formattedTime as String,
      user: user == freezed ? this.user : user as User,
    );
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {String formattedDate, String formattedTime, User user}) = _$_HomeState;

  @override
  String get formattedDate;
  @override
  String get formattedTime;
  @override
  User get user;

  @override
  _HomeState copyWith({String formattedDate, String formattedTime, User user});
}
