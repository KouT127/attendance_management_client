import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

typedef GetIdToken = Future<IdTokenResult> Function({bool refresh});

@freezed
abstract class User with _$User {
  const factory User({
    String uid,
    String email,
    String displayName,
    String photoUrl,
    bool isEmailVerified,
    GetIdToken getIdToken,
  }) = _User;
}
