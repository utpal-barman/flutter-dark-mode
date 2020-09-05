part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final String themedata;

  ThemeState(this.themedata);
}

class ThemeInitial extends ThemeState {
  ThemeInitial(String themedata) : super(themedata);
}

class SetThemeTo extends ThemeState {
  SetThemeTo(String themedata) : super(themedata);
}
