import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';

@freezed
abstract class ServerResponse<T> with _$ServerResponse {
  const factory ServerResponse({
    bool isSuccessful,
    T item,
  }) = _ServerResponse;

  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);
}

@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({
    String id,
    String name,
    String imageURL,
    String email,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
