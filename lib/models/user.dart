import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

typedef GetIdToken = Future<String> Function([bool refresh]);

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    String uid,
    String email,
    String displayName,
    String photoURL,
    bool emailVerified,
    GetIdToken getIdToken,
  }) = _UserState;
}
