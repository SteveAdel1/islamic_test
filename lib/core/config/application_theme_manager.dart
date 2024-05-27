import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xFFB7935F);
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontFamily: "El Messiri",
            fontWeight: FontWeight.bold,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontFamily: "El Messiri",
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              fontFamily: "El Messiri",
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          )));
  static ThemeData darkTheme = ThemeData();
}
