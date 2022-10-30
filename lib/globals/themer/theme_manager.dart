import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelo/globals/themer/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    textTheme: GoogleFonts.poppinsTextTheme(),
    // brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.white),
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme(),
    // brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.black),
  );

  ThemeData _themeData = ThemeData();
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    ThemeStorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    ThemeStorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    ThemeStorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
