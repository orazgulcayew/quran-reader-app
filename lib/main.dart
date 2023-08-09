import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader_app/blocs/main_navigation/main_navigation_cubit.dart';
import 'package:quran_reader_app/config/theme/theme.dart';
import 'package:quran_reader_app/injection_container.dart';

import 'main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const QuranReaderApp());
}

class QuranReaderApp extends StatelessWidget {
  const QuranReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran in Multilanguage',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      // darkTheme: AppTheme.darkTheme(),
      home: BlocProvider<MainNavigationCubit>(
        create: (context) => sl(),
        child: const MainNavigation(),
      ),
    );
  }
}
