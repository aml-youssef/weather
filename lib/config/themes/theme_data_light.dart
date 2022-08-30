import 'package:flutter/material.dart';

ThemeData appLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 135, 206, 235),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 135, 206, 235),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 247, 247, 104)),
    drawerTheme:
        const DrawerThemeData(backgroundColor: Color.fromARGB(255, 135, 206, 235)),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: const Color.fromARGB(255, 184, 226, 243),
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
      color: const Color.fromARGB(200, 184, 226, 243),
    ),
  );
}
