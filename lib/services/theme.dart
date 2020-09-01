import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  primaryColorBrightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light().copyWith(
      primary: Colors.grey.withOpacity(.1),
      secondary: Colors.white70,
      primaryVariant: Colors.green,
      error: Colors.red.withOpacity(.8)),
  cardColor: Colors.black12,
  backgroundColor: SkyBlue,
  accentColor: Colors.black,
  dividerColor: Colors.white54,
  primaryIconTheme: IconThemeData(
    color: SkyBlue,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: SkyBlue,
    backgroundColor: Colors.white,
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    headline2: TextStyle(
      color: Colors.black.withOpacity(.8),
      fontSize: 35,
      fontWeight: FontWeight.w600,
    ),
    headline1: TextStyle(
      color: Colors.black.withOpacity(.6),
      fontSize: 29,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      color: Colors.black.withOpacity(.5),
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      color: Colors.white70,
      fontSize: 30,
      fontWeight: FontWeight.w300,
    ),
    bodyText2: TextStyle(
      color: Colors.white70,
      fontSize: 25,
      fontWeight: FontWeight.w400,
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

  void setTheme(ThemeData themeData) {
    this.themeData = themeData;
    notifyListeners();
  }
}
