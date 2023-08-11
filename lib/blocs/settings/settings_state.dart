part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool isDark;
  const SettingsState({required this.isDark});

  @override
  List<Object> get props => [isDark];

  ThemeMode get themeMode {
    if (isDark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
