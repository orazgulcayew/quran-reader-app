import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/blocs/settings/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(20),
            color: theme.background,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  onTap: () {},
                  leading: const Icon(Iconsax.global),
                  title: const Text('Language'),
                ),
                ListTile(
                  onTap: () {
                    settingsBloc.add(ChangeThemeEvent(value: !state.isDark));
                  },
                  leading: const Icon(Iconsax.sun_1),
                  trailing: Switch(
                    value: state.isDark,
                    onChanged: (value) {
                      settingsBloc.add(ChangeThemeEvent(value: value));
                    },
                  ),
                  title: const Text('Theme'),
                ),
              ]).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
