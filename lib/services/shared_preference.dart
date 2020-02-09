import 'package:shared_preferences/shared_preferences.dart';

const HadStarted = 'HAD_STARTED';

class AppPreferences {
  AppPreferences();

  factory AppPreferences.create() {
    return AppPreferences();
  }

  Future<bool> getHadStarted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final hadStarted = preferences.getBool(HadStarted) ?? false;
    return hadStarted;
  }

  Future<void> setHadStarted(bool hadStarted) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(HadStarted, hadStarted);
  }
}
