import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader_app/blocs/main_navigation/main_navigation_cubit.dart';
import 'package:quran_reader_app/blocs/settings/settings_bloc.dart';

import 'package:quran_reader_app/injection_container.dart';

import 'config/theme/theme.dart';
import 'main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.dark.copyWith(
  //     systemNavigationBarColor: AppTheme.background,
  //   ),
  // );

  runApp(const QuranReaderApp());
}

class QuranReaderApp extends StatelessWidget {
  const QuranReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainNavigationCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => sl(),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) => MaterialApp(
                title: 'Quran in Multilanguage',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme(),
                darkTheme: AppTheme.darkTheme(),
                themeMode: state.themeMode,
                home: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark.copyWith(
                        systemNavigationBarColor: state.navigationColor),
                    child: const MainNavigation()),
              )),
    );
  }
}
