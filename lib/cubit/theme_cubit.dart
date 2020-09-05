import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial('empty'));

  void setThemeDataDark() => emit(SetThemeTo('dark'));
  void setThemeDataLight() => emit(SetThemeTo('light'));
}
