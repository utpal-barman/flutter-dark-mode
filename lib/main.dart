import 'package:dark_mode_app/screen/app_screen.dart';
import 'package:dark_mode_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeDataNotifier>.value(
      value: ThemeDataNotifier(),
      child: MaterailAppWidget(),
    );
    //return MaterailAppWidget();
  }
}

class MaterailAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<ThemeDataNotifier>(context);

    return FutureBuilder(
      future: dataProvider.getThemeDataInFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) => MaterialApp(
        title: 'Dark Mode Demo',
        theme: snapshot.data,
        home: AppScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
