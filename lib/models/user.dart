import 'package:flutter/material.dart';

class User {
  String token;
  String email;
  String displayName;
  String photoUrl;
  bool isEmailVerified;

  User({
    @required this.token,
    @required this.email,
    @required this.displayName,
    this.photoUrl,
    @required this.isEmailVerified,
  });
}
