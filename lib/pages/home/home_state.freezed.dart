// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$HomeState {
  DateTime get datetime;
  User get user;
  double get totalTime;
  double get workedTime;

  HomeState copyWith(
      {DateTime datetime, User user, double totalTime, double workedTime});
}

class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {DateTime datetime,
      User user,
      double totalTime = 0,
      double workedTime = 0}) {
    return _HomeState(
      datetime: datetime,
      user: user,
      totalTime: totalTime,
      workedTime: workedTime,
    );
  }
}

const $HomeState = _$HomeStateTearOff();

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.datetime, this.user, this.totalTime = 0, this.workedTime = 0});

  @override
  final DateTime datetime;
  @override
  final User user;
  @JsonKey(defaultValue: 0)
  @override
  final double totalTime;
  @JsonKey(defaultValue: 0)
  @override
  final double workedTime;

  @override
  String toString() {
    return 'HomeState(datetime: $datetime, user: $user, totalTime: $totalTime, workedTime: $workedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.datetime, datetime) ||
                const DeepCollectionEquality()
                    .equals(other.datetime, datetime)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.totalTime, totalTime) ||
                const DeepCollectionEquality()
                    .equals(other.totalTime, totalTime)) &&
            (identical(other.workedTime, workedTime) ||
                const DeepCollectionEquality()
                    .equals(other.workedTime, workedTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(datetime) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(totalTime) ^
      const DeepCollectionEquality().hash(workedTime);

  @override
  _$_HomeState copyWith({
    Object datetime = freezed,
    Object user = freezed,
    Object totalTime = freezed,
    Object workedTime = freezed,
  }) {
    return _$_HomeState(
      datetime: datetime == freezed ? this.datetime : datetime as DateTime,
      user: user == freezed ? this.user : user as User,
      totalTime: totalTime == freezed ? this.totalTime : totalTime as double,
      workedTime:
          workedTime == freezed ? this.workedTime : workedTime as double,
    );
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {DateTime datetime,
      User user,
      double totalTime,
      double workedTime}) = _$_HomeState;

  @override
  DateTime get datetime;
  @override
  User get user;
  @override
  double get totalTime;
  @override
  double get workedTime;

  @override
  _HomeState copyWith(
      {DateTime datetime, User user, double totalTime, double workedTime});
}
