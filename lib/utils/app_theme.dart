
import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: kPrimaryWhite,
    scaffoldBackgroundColor: kPrimaryWhite,
    colorScheme: const ColorScheme.light(),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryWhite,
      elevation: 0,
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      },
    ),
  );


  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: kPrimaryBlack,
    scaffoldBackgroundColor: kPrimaryBlack,
    colorScheme: const ColorScheme.dark(),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryBlack,
      elevation: 0,
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      },
    ),
  );

  static bool isDarkMode(){
    // final themeProvider = ThemeProvider();
    // return themeProvider.getThemeMode == ThemeMode.dark;
    return false;
  }


}
