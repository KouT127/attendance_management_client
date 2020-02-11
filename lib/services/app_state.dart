import 'package:attendance_management/models/models.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  AppState({
    this.application,
  });

  Application application;

  factory AppState.create() {
    return AppState(
      application: Application.initial(),
    );
  }

  void update({bool initialLoaded}) {
    this.application = this.application.copyWith(initialLoaded: true);
    notifyListeners();
  }
}
