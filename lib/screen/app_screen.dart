import 'package:dark_mode_app/settings_prefs/theme_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  var _value = false;

  @override
  void initState() {
    initStateHelper();
    super.initState();
  }

  initStateHelper() async {
    ThemePrefs themePrefs = ThemePrefs();
    _value = await themePrefs.getDarkModePrefs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dark Mode"),
      ),
      body: Center(
        child: Switch(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            Provider.of<ThemeDataNotifier>(context, listen: false).setThemeData(
              value ? ThemeData.dark() : ThemeData.light(),
            );
            ThemePrefs themePrefs = ThemePrefs();
            themePrefs.setDarkModepref(value);
          },
        ),
      ),
    );
  }
}
