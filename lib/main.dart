import 'package:dark_mode_app/cubit/theme_cubit.dart';
import 'package:dark_mode_app/screen/app/app_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('themeBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Dark Mode Demo',
          theme: getTheme(state.themedata),
          home: AppScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  getTheme(theme) {
    if (theme == "dark") {
      print("theme is dark");
      return ThemeData.dark();
    } else if (theme == "light") {
      print("theme is light");
      return ThemeData.light();
    } else if (Hive.box("themeBox").get("themeData") != null) {
      print("theme is not light or dark : Hive value");
      print(Hive.box("themeBox").get("themeData"));
      return Hive.box("themeBox").get("themeData")
          ? ThemeData.dark()
          : ThemeData.light();
    } else {
      print("no state or saved data, reverting to default");
      return ThemeData.light();
    }
  }
}
