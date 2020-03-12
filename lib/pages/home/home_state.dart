import 'package:attendance_management/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    String formattedDate,
    String formattedTime,
    User user,
  }) = _HomeState;
}
