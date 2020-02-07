import 'package:attendance_management/services/auth.dart';
import 'package:flutter/material.dart';

class User {
  User({
    @required this.uid,
    @required this.token,
    @required this.email,
    @required this.displayName,
    this.photoUrl,
    @required this.isEmailVerified,
    @required this.getToken,
  });

  String uid;
  String token;
  String email;
  String displayName;
  String photoUrl;
  bool isEmailVerified;
  GetToken getToken;
}
