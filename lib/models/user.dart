import 'package:attendance_management/services/user_state.dart';
import 'package:flutter/material.dart';

class User {
  User({
    @required this.uid,
    @required this.email,
    @required this.displayName,
    @required this.getToken,
    this.photoUrl,
    this.isEmailVerified = false,
  });

  factory User.initial() {
    return User(
      uid: null,
      email: null,
      displayName: null,
      getToken: null,
    );
  }

  String uid;
  String email;
  String displayName;
  String photoUrl;
  bool isEmailVerified;
  GetToken getToken;
}
