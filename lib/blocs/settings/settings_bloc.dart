import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader_app/config/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences cache;

  SettingsBloc(this.cache)
      : super(SettingsState(isDark: cache.getBool('isDark') ?? false)) {
    on<SettingsEvent>((event, emit) {
      if (event is ChangeThemeEvent) {
        saveCache(event.value);

        emit(SettingsState(isDark: event.value));
      }
    });
  }

  void saveCache(bool value) {
    cache.setBool('isDark', value);
  }

  bool get isDark => cache.getBool('isDark') ?? false;
}
