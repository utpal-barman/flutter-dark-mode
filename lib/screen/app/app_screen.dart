import 'package:dark_mode_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/switch_widget.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("app screen is built");
    return Scaffold(
      appBar: AppBar(
        title: Text("Dark Mode"),
      ),
      body: Center(
        child: SwitchWidget(),
      ),
    );
  }
}
