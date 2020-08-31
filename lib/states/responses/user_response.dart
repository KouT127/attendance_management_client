import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({
    bool isSuccessful,
    UserResponseItem user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
abstract class UserResponseItem with _$UserResponseItem {
  const factory UserResponseItem({
    String id,
    String name,
    String imageURL,
    String email,
  }) = _UserResponseItem;

  factory UserResponseItem.fromJson(Map<String, dynamic> json) =>
      _$UserResponseItemFromJson(json);
}
