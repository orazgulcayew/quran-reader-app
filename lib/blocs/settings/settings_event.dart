part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends SettingsEvent {
  final bool value;

  const ChangeThemeEvent({required this.value});

  @override
  List<Object> get props => [value];
}
