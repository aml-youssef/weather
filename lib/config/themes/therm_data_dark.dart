import 'package:flutter/material.dart';

ThemeData AppDarkTheme() {
  return ThemeData(
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),
    hintColor: Color.fromARGB(255, 184, 183, 183),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 247, 247, 104)),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 73, 73, 73),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // Foreground color
        onPrimary: Colors.white,
        // Background color
        primary: Color.fromARGB(255, 190, 189, 189),
      ).copyWith(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          elevation: ButtonStyleButton.allOrNull(0.0)),
    ),
    cardTheme: CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Color.fromARGB(200, 190, 189, 189),
    ),
  );
}
