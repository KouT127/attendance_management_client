import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  primaryColorBrightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light().copyWith(
    primary: Colors.white,
    secondary: Colors.white70,
  ),
  cardColor: Colors.black12,
  backgroundColor: SkyBlue,
  accentColor: Colors.black,
  dividerColor: Colors.white54,
  primaryIconTheme: IconThemeData(
    color: SkyBlue,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: SkyBlue,
    backgroundColor: Colors.white,
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    title: TextStyle(
      color: Colors.white,
      fontSize: 35,
      fontWeight: FontWeight.w600,
    ),
    subtitle: TextStyle(
      color: Colors.white70,
      fontSize: 30,
      fontWeight: FontWeight.w300,
    ),
    body1: TextStyle(
      color: Colors.white70,
      fontSize: 25,
      fontWeight: FontWeight.w400,
    ),
    body2: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    button: TextStyle(
      color: SkyBlue,
      fontSize: 25,
      fontWeight: FontWeight.w500,
    ),
  ),
);

class Theme extends ChangeNotifier {
  Theme({
    this.themeData,
  });

  ThemeData themeData;

  setTheme(ThemeData themeData) async {
    themeData = themeData;
    notifyListeners();
  }
}
