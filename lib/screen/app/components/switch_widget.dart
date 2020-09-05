import 'package:dark_mode_app/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    Key key,
  }) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _value = Hive.box('themeBox').get('themeData') ?? false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: _value,
          onChanged: (value) {
            Hive.box('themeBox').put('themeData', value);
            value
                ? context.bloc<ThemeCubit>().setThemeDataDark()
                : context.bloc<ThemeCubit>().setThemeDataLight();
            setState(() {
              _value = value;
            });
          },
        );
      },
    );
  }
}
