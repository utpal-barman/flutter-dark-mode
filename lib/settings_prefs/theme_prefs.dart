import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefs {
  bool isDarkModeIsOn;

  SharedPreferences sharedPreferences;

  get getDarkModePrefs async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("isDarkModeIsOn") ?? true;
  }

  setDarkModepref(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDarkModeIsOn", value);
  }
}
