import 'package:attendance_management/services/auth.dart';
import 'package:flutter/material.dart';

class User {
  User({
    @required this.uid,
    @required this.email,
    @required this.displayName,
    this.photoUrl,
    @required this.isEmailVerified,
    @required this.getToken,
    @required this.isAnonymous,
    @required this.isUserCreated,
  });

  String uid;
  String email;
  String displayName;
  String photoUrl;
  bool isEmailVerified;
  bool isAnonymous;
  GetToken getToken;

  // API用のフラグ
  bool isUserCreated;
}
