import 'package:attendance_management/states/states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    DateTime datetime,
    UserState user,
    @Default(0) double totalTime,
    @Default(0) double workedTime,
  }) = _HomeState;
}
