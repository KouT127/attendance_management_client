import 'package:attendance_management/models/user.dart';
import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  UserState({
    this.user,
  });

  User user;

  factory UserState.create({User user}) {
    return UserState(
      user: user,
    );
  }

  void onUpdateUser(User user) {
    this.user = user;
    notifyListeners();
  }
}
