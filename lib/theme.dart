import 'package:dark_mode_app/settings_prefs/theme_prefs.dart';
import 'package:flutter/material.dart';

class ThemeDataNotifier with ChangeNotifier {
  var _isDarkModeIsOn;
  var _themeData;

  ThemePrefs themePrefs = ThemePrefs();

  loadThemeData() async {
    _isDarkModeIsOn = await themePrefs.getDarkModePrefs;
    _themeData = _isDarkModeIsOn ? ThemeData.dark() : ThemeData.light();
    return _themeData;
  }

  // get which theme is running
  get getThemeDataInFuture async {
    return await loadThemeData();
  }

  // set theme dynamically over the app
  setThemeData(ThemeData themeData) {
    setThemePref(_isDarkModeIsOn);
    _themeData = themeData;
    notifyListeners();
  }

  setThemePref(value) async {
    await themePrefs.setDarkModepref(value);
  }
}
