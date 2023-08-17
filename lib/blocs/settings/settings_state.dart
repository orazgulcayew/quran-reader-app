part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool isDark;
  const SettingsState({required this.isDark});

  @override
  List<Object> get props => [isDark];

  Color get navigationColor {
    return isDark ? AppTheme.darkBackground : AppTheme.background;
  }

  ThemeMode get themeMode {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
